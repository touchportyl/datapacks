import os
import re
import shutil
import tkinter as tk
from tkinter import filedialog, ttk, scrolledtext, messagebox, font as tk_font
from datetime import datetime
from configparser import ConfigParser
from pathlib import Path
from threading import Thread, Lock

class DatapackManagerApp(tk.Tk):
    """
    Main application for the Datapack Manager Tool.
    Built for Minecraft version 1.21.8.
    """
    VERSION = "mc1.21.8"
    
    def __init__(self):
        super().__init__()
        self.title(f"Datapack Manager Tool - {self.VERSION}")
        
        # Define window dimensions
        window_width = 1600
        window_height = 900

        # Get screen dimensions
        screen_width = self.winfo_screenwidth()
        screen_height = self.winfo_screenheight()

        # Calculate center position
        center_x = int((screen_width - window_width) / 2)
        center_y = int((screen_height - window_height) / 2)

        # Set window size and position
        self.geometry(f'{window_width}x{window_height}+{center_x}+{center_y}')

        self.config = ConfigParser()
        self.settings_file_path = self.get_settings_path()
        self.load_settings()
        
        # Apply a modern style to the UI
        style = ttk.Style(self)
        style.theme_use('clam')
        style.configure('TButton', font=(None, 10, 'bold'), borderwidth=1, relief="raised")
        style.map('TButton',
            foreground=[('active', 'black')],
            background=[('active', 'cyan'), ('pressed', 'blue')])
        style.configure('Custom.TButton', background='lightgreen', foreground='black', borderwidth=2)
        style.configure("Treeview", font=(None, 9))
        style.configure("Treeview.Heading", font=(None, 10, 'bold'))

        self.notebook = ttk.Notebook(self)
        self.notebook.pack(expand=True, fill="both", padx=10, pady=10)

        # Create the LogFrame first so other frames can reference it
        self.log_frame = LogFrame(self.notebook)
        self.log_frame.pack(expand=True, fill="both")

        # Instantiate the other tool frames
        self.parser_frame = ParserFrame(self.notebook, self.config, self.log_frame)
        self.cloner_frame = ClonerFrame(self.notebook, self.config, self.log_frame)
        self.settings_frame = SettingsFrame(self.notebook, self.config, self.parser_frame, self.cloner_frame)

        # Add all frames to the main notebook
        self.notebook.add(self.parser_frame, text="Tag Parser")
        self.notebook.add(self.cloner_frame, text="Release Tool")
        self.notebook.add(self.log_frame, text="Logs")
        self.notebook.add(self.settings_frame, text="Settings")
    
        self.parser_frame.load_path_from_settings()
        self.cloner_frame.load_path_from_settings()

    def get_settings_path(self):
        temp_config = ConfigParser()
        script_dir_ini = Path(__file__).resolve().parent / "dmtool_settings.ini"
        temp_config.read(script_dir_ini)
        
        saved_path = temp_config.get("Settings", "save_path", fallback="")
        if saved_path and os.path.isdir(saved_path):
            return Path(saved_path) / "dmtool_settings.ini"
        else:
            return script_dir_ini

    def load_settings(self):
        try:
            self.config.read(self.settings_file_path)
            if "Settings" not in self.config:
                self.config.add_section("Settings")
                self.config.set("Settings", "save_path", str(self.settings_file_path.parent))
        except Exception as e:
            print(f"Could not load settings from {self.settings_file_path}: {e}")

class LogFrame(ttk.Frame):
    """
    A dedicated frame for centralized logging output.
    """
    def __init__(self, parent):
        super().__init__(parent)
        self.log_area = scrolledtext.ScrolledText(self, wrap=tk.WORD, state=tk.DISABLED, height=15)
        self.log_area.pack(fill=tk.BOTH, expand=True, padx=10, pady=5)

        self.log_area.tag_config('info', foreground='blue')
        self.log_area.tag_config('success', foreground='green')
        self.log_area.tag_config('error', foreground='red')
        self.log_area.tag_config('warning', foreground='orange')
        
    def log(self, message, log_type='info'):
        """Inserts a message into the log area with a timestamp and color."""
        timestamp = datetime.now().strftime("[%Y-%m-%d %H:%M:%S]")
        self.log_area.config(state=tk.NORMAL)
        self.log_area.insert(tk.END, f"{timestamp} {message}\n", log_type)
        self.log_area.see(tk.END)
        self.log_area.config(state=tk.DISABLED)
        self.master.update_idletasks() # Refresh the GUI

    def clear_logs(self):
        """Clears the contents of the log area."""
        self.log_area.config(state=tk.NORMAL)
        self.log_area.delete(1.0, tk.END)
        self.log_area.config(state=tk.DISABLED)

class SettingsFrame(ttk.Frame):
    def __init__(self, parent, config, parser_frame, cloner_frame):
        super().__init__(parent)
        self.config = config
        self.parser_frame = parser_frame
        self.cloner_frame = cloner_frame

        self.label = ttk.Label(self, text="Settings Folder Location:")
        self.label.pack(pady=(20, 5))

        self.entry_var = tk.StringVar(value=self.config.get("Settings", "save_path", fallback=""))
        self.path_entry = ttk.Entry(self, textvariable=self.entry_var, width=50)
        self.path_entry.pack(pady=5)
        self.path_entry.config(state='readonly')

        self.browse_button = ttk.Button(self, text="Browse", command=self.browse_path)
        self.browse_button.pack(pady=5)

        self.status_label = ttk.Label(self, text="")
        self.status_label.pack(pady=5)

    def browse_path(self):
        initial_dir = self.config.get("Settings", "save_path", fallback=str(Path(__file__).resolve().parent))
        if not os.path.isdir(initial_dir):
            initial_dir = str(Path(__file__).resolve().parent)

        directory = filedialog.askdirectory(initialdir=initial_dir)
        if directory:
            self.entry_var.set(directory)
            self.save_settings(directory)
            self.status_label.config(text=f"Settings path updated to {directory}", foreground="green")
            self.master.settings_file_path = Path(directory) / "dmtool_settings.ini"

    def save_settings(self, directory):
        self.config.set("Settings", "save_path", directory)
        self.config.set("Settings", "tag_parser_path", self.parser_frame.target_path_var.get())
        self.config.set("Settings", "release_tool_path", self.cloner_frame.dir_entry_var.get())
        
        settings_file = Path(directory) / "dmtool_settings.ini"
        try:
            with open(settings_file, "w") as config_file:
                self.config.write(config_file)
        except Exception as e:
            self.status_label.config(text=f"Error saving settings: {e}", foreground="red")

class DatapackFrame(ttk.Frame):
    def __init__(self, parent, config):
        super().__init__(parent)
        self.config = config
        self.notebook = ttk.Notebook(self)
        self.notebook.pack(expand=True, fill="both")
        self.datapack_notebooks = {} # Dictionary to hold internal notebooks
        self.internal_notebooks = {} # Dictionary to hold tag type notebooks
        self.trees = {} # Dictionary to hold Treeview widgets for each tab

    def get_or_create_datapack_tab(self, datapack_name):
        if datapack_name in self.datapack_notebooks:
            return self.datapack_notebooks[datapack_name]
        
        # Create a new frame for the top-level datapack tab
        datapack_frame = ttk.Frame(self.notebook)
        
        # Create a nested notebook inside the datapack tab
        nested_notebook = ttk.Notebook(datapack_frame)
        nested_notebook.pack(expand=True, fill="both")
        
        self.notebook.add(datapack_frame, text=datapack_name)
        self.datapack_notebooks[datapack_name] = nested_notebook
        return nested_notebook

    def get_or_create_internal_tab(self, datapack_name, internal_name):
        datapack_notebook = self.get_or_create_datapack_tab(datapack_name)
        
        if (datapack_name, internal_name) in self.internal_notebooks:
            return self.internal_notebooks[(datapack_name, internal_name)]
        
        # Create a new frame for the internal tab
        internal_frame = ttk.Frame(datapack_notebook)
        
        # Create a second nested notebook for tag types
        tag_notebook = ttk.Notebook(internal_frame)
        tag_notebook.pack(expand=True, fill="both")
        
        datapack_notebook.add(internal_frame, text=internal_name)
        self.internal_notebooks[(datapack_name, internal_name)] = tag_notebook
        return tag_notebook

    def get_or_create_tag_tab(self, datapack_name, internal_name, tag_type):
        tag_notebook = self.get_or_create_internal_tab(datapack_name, internal_name)
        
        if (datapack_name, internal_name, tag_type) in self.trees:
            return self.trees[(datapack_name, internal_name, tag_type)]
        
        # Create a new frame for the tag type tab
        tag_frame = ttk.Frame(tag_notebook)
        
        # Create a Treeview in the new tag type tab
        tree = ttk.Treeview(tag_frame, columns=("Tag", "File", "Line #", "Full Line"), show="headings")
        tree.heading("Tag", text="Tag")
        tree.heading("File", text="File")
        tree.heading("Line #", text="Line #")
        tree.heading("Full Line", text="Full Line")
        
        # Create scrollbars for this treeview
        v_scrollbar = ttk.Scrollbar(tag_frame, orient="vertical", command=tree.yview)
        h_scrollbar = ttk.Scrollbar(tag_frame, orient="horizontal", command=tree.xview)
        tree.configure(yscrollcommand=v_scrollbar.set, xscrollcommand=h_scrollbar.set)
        
        v_scrollbar.pack(side="right", fill="y")
        h_scrollbar.pack(side="bottom", fill="x")
        tree.pack(side="left", expand=True, fill="both")

        tag_notebook.add(tag_frame, text=tag_type)
        self.trees[(datapack_name, internal_name, tag_type)] = tree
        return tree

class ParserFrame(ttk.Frame):
    def __init__(self, parent, config, logger):
        super().__init__(parent)
        self.config = config
        self.logger = logger
        self.target_path_var = tk.StringVar()
        self.is_parsing = False
        self.parsing_thread = None
        self.data_lock = Lock()
        self.max_widths = {}
        self.found_tags_queue = []
        
        # Bind events for dynamic resizing
        self.master.bind("<Shift-MouseWheel>", self._on_shift_scroll)
        self.after_idle(self._bind_tab_change_events)

        path_frame = ttk.Frame(self)
        path_frame.pack(fill="x", padx=10, pady=10)

        ttk.Label(path_frame, text="Target Folder:").pack(side="left")
        self.path_entry = ttk.Entry(path_frame, textvariable=self.target_path_var, width=60)
        self.path_entry.pack(side="left", expand=True, fill="x", padx=(5, 0))
        self.browse_button = ttk.Button(path_frame, text="Browse", command=self.browse_folder)
        self.browse_button.pack(side="left", padx=(5, 0))

        # Button frame for Parse and Cancel
        button_frame = ttk.Frame(self)
        button_frame.pack(pady=5)
        self.parse_button = ttk.Button(button_frame, text="Parse", command=self._start_parsing_thread, style='Custom.TButton')
        self.parse_button.pack(side="left", padx=5)
        self.cancel_button = ttk.Button(button_frame, text="Cancel", command=self._cancel_parsing, state='disabled')
        self.cancel_button.pack(side="left", padx=5)
        
        # Create a Frame to hold the Datapack tabs
        self.datapack_frame = DatapackFrame(self, self.config)
        self.datapack_frame.pack(expand=True, fill="both", padx=10, pady=10)

    def _bind_tab_change_events(self):
        """Binds to notebook tab change events to trigger resizing."""
        # Find the correct notebook widget to bind to. This is tricky due to the nested structure.
        # We need to bind to the notebook inside the ParserFrame's DatapackFrame
        self.datapack_frame.notebook.bind("<<NotebookTabChanged>>", self._on_tab_change)

    def _on_tab_change(self, event):
        """Callback to resize columns when a tab changes."""
        # Find the currently active Treeview in the three-layered notebook structure
        active_datapack_tab_id = self.datapack_frame.notebook.select()
        
        # Check if a tab is actually selected. If not, do nothing.
        if not active_datapack_tab_id:
            return

        active_datapack_tab_text = self.datapack_frame.notebook.tab(active_datapack_tab_id, "text")
        
        # This is the correct way to bind nested tabs
        if active_datapack_tab_text in self.datapack_frame.datapack_notebooks:
            active_datapack_notebook = self.datapack_frame.datapack_notebooks.get(active_datapack_tab_text)
            active_datapack_notebook.bind("<<NotebookTabChanged>>", self._on_tab_change_nested)
            
            active_internal_tab_id = active_datapack_notebook.select()
            active_internal_tab_text = active_datapack_notebook.tab(active_internal_tab_id, "text")
            
            if (active_datapack_tab_text, active_internal_tab_text) in self.datapack_frame.internal_notebooks:
                active_tag_notebook = self.datapack_frame.internal_notebooks.get((active_datapack_tab_text, active_internal_tab_text))
                active_tag_tab_id = active_tag_notebook.select()
                active_tag_tab_text = active_tag_notebook.tab(active_tag_tab_id, "text")
                
                active_tree = self.datapack_frame.trees.get((active_datapack_tab_text, active_internal_tab_text, active_tag_tab_text))
                
                if active_tree:
                    self._resize_columns(active_tree)

    def _on_tab_change_nested(self, event):
        """Helper for nested tab changes."""
        # Get the notebook that triggered the event
        notebook = event.widget
        
        # Get the ID of the selected tab
        active_tab_id = notebook.select()
        active_tab_text = notebook.tab(active_tab_id, "text")

        # Find the tree associated with this new tab
        for (datapack, internal, tag_type), tree in self.datapack_frame.trees.items():
            if tag_type == active_tab_text and tree.winfo_parent() == notebook.children[notebook.tab(active_tab_id, "text").lower()]:
                 self._resize_columns(tree)
                 break

    def _on_shift_scroll(self, event):
        """Increase horizontal scroll speed with Shift + MouseWheel."""
        # Find the currently active Treeview in the three-layered notebook structure
        active_datapack_tab_id = self.datapack_frame.notebook.select()
        active_datapack_tab_text = self.datapack_frame.notebook.tab(active_datapack_tab_id, "text")
        
        if active_datapack_tab_text in self.datapack_frame.datapack_notebooks:
            active_datapack_notebook = self.datapack_frame.datapack_notebooks.get(active_datapack_tab_text)
            active_internal_tab_id = active_datapack_notebook.select()
            active_internal_tab_text = active_datapack_notebook.tab(active_internal_tab_id, "text")

            if (active_datapack_tab_text, active_internal_tab_text) in self.datapack_frame.internal_notebooks:
                active_tag_notebook = self.datapack_frame.internal_notebooks.get((active_datapack_tab_text, active_internal_tab_text))
                active_tag_tab_id = active_tag_notebook.select()
                active_tag_tab_text = active_tag_notebook.tab(active_tag_tab_id, "text")
                
                active_tree = self.datapack_frame.trees.get((active_datapack_tab_text, active_internal_tab_text, active_tag_tab_text))
                
                if active_tree:
                    scroll_speed = 10 
                    direction = -int(event.delta / 120) * scroll_speed
                    active_tree.xview_scroll(direction, "units")

    def _resize_columns(self, tree):
        """Dynamically resizes columns to fit contents."""
        if not tree:
            return
        
        default_font = tk_font.Font()
        columns = tree["columns"]
        buffer = 15
        
        for col in columns:
            heading_width = default_font.measure(tree.heading(col, "text")) + buffer
            max_width = heading_width
            
            for item in tree.get_children():
                try:
                    item_width = default_font.measure(str(tree.item(item, 'values')[tree['columns'].index(col)])) + buffer
                    if item_width > max_width:
                        max_width = item_width
                except IndexError:
                    pass
            
            tree.column(col, width=max_width, stretch=False)

    def browse_folder(self):
        initial_dir = self.target_path_var.get()
        if not os.path.isdir(initial_dir):
            initial_dir = None
        folder_path = filedialog.askdirectory(initialdir=initial_dir)
        if folder_path:
            self.target_path_var.set(folder_path)
            self.save_path_to_settings()

    def save_path_to_settings(self):
        if "Settings" not in self.config:
            self.config.add_section("Settings")
        self.config.set("Settings", "tag_parser_path", self.target_path_var.get())
        settings_folder = self.config.get("Settings", "save_path", fallback=str(Path(__file__).resolve().parent))
        settings_file = Path(settings_folder) / "dmtool_settings.ini"
        try:
            with open(settings_file, "w") as config_file:
                self.config.write(config_file)
        except Exception as e:
            self.logger.log(f"Error saving parser path: {e}", log_type='error')

    def load_path_from_settings(self):
        saved_path = self.config.get("Settings", "tag_parser_path", fallback="")
        if saved_path and os.path.isdir(saved_path):
            self.target_path_var.set(saved_path)

    def _start_parsing_thread(self):
        target_path = self.target_path_var.get()
        if not target_path or not os.path.isdir(target_path):
            self.logger.log("Error: Please select a valid folder.", log_type='error')
            return
        
        self.is_parsing = True
        
        # Clear existing tabs
        for tab in self.datapack_frame.notebook.tabs():
            self.datapack_frame.notebook.forget(tab)
        self.datapack_frame.datapack_notebooks = {}
        self.datapack_frame.internal_notebooks = {}
        self.datapack_frame.trees = {}

        with self.data_lock:
            self.found_tags_queue = []
            self.max_widths = {}
        
        self.logger.log("Parsing started...", log_type='info')
        
        self.parse_button.config(text="Parsing...", state="disabled")
        self.cancel_button.config(state="normal")
        self.browse_button.config(state="disabled")

        self.parsing_thread = Thread(target=self._threaded_parsing_task, args=(target_path,))
        self.parsing_thread.daemon = True
        self.parsing_thread.start()

    def _cancel_parsing(self):
        self.is_parsing = False
        self.logger.log("Parsing cancelled by user.", log_type='warning')
        self.cancel_button.config(state="disabled")
        self.parse_button.config(text="Parse", state="normal")
        self.browse_button.config(state="normal")

    def _get_tag_type(self, tag):
        if "$" in tag:
            parts = tag.split('$')
            if parts[0]:
                return parts[0].capitalize()
        elif re.match(r'[A-Z]{2}_', tag):
            return "Player Tags"
        return "Misc"

    def _threaded_parsing_task(self, target_path):
        pattern = r'[A-Z]{2}_[a-zA-Z0-9_]+|[A-Z]+\$[a-zA-Z0-9.]+'
        matches_found = False
        
        ignored_folders = ['advancements', 'functions', 'predicates', 'item_modifiers', 'recipes', 'loot_tables', 'tags']

        for root, dirs, files in os.walk(target_path):
            dirs[:] = [d for d in dirs if d not in ignored_folders]

            for file in files:
                if not self.is_parsing:
                    return
                
                relative_path = os.path.relpath(os.path.join(root, file), target_path)
                
                datapack_name = "Other"
                internal_name = "Misc"

                if 'data' in relative_path.split(os.sep):
                    parts = Path(relative_path).parts
                    try:
                        data_index = parts.index('data')
                        if data_index > 0:
                            datapack_name = parts[data_index - 1]
                        if len(parts) > data_index + 1:
                            internal_name = parts[data_index + 1]
                    except ValueError:
                        pass

                file_path = os.path.join(root, file)
                try:
                    with open(file_path, "r", encoding="utf-8") as f:
                        for line_number, line in enumerate(f, start=1):
                            if not self.is_parsing:
                                return
                            if line.strip().startswith('#'):
                                continue
                            
                            found_tags = re.findall(pattern, line)
                            if found_tags:
                                matches_found = True
                                with self.data_lock:
                                    for tag in found_tags:
                                        tag_type = self._get_tag_type(tag)
                                        full_line = line.strip()
                                        self.found_tags_queue.append((datapack_name, internal_name, tag_type, tag, relative_path, line_number, full_line))
                                        
                except Exception as e:
                    self.logger.log(f"Could not read {file_path}: {e}", log_type='error')
        
        self.after(0, lambda: self._parsing_finished(matches_found))

    def _parsing_finished(self, matches_found):
        self.found_tags_queue.sort(key=lambda x: (x[0], x[1], x[2]))

        for item in self.found_tags_queue:
            datapack_name, internal_name, tag_type, tag, relative_path, line_number, full_line = item
            
            tree = self.datapack_frame.get_or_create_tag_tab(datapack_name, internal_name, tag_type)
            
            if tree:
                tree.insert("", "end", values=(tag, relative_path, line_number, full_line))

        for tree in self.datapack_frame.trees.values():
            self._resize_columns(tree)

        self.parse_button.config(text="Parse", state="normal")
        self.cancel_button.config(state="disabled")
        self.browse_button.config(state="normal")
        self.is_parsing = False
        
        if matches_found:
            self.logger.log("Parsing complete.", log_type='success')
        else:
            self.logger.log("No matches found.", log_type='warning')

class ClonerFrame(ttk.Frame):
    def __init__(self, parent, config, logger):
        super().__init__(parent)
        self.config = config
        self.logger = logger
        self.dir_entry_var = tk.StringVar()
        
        self.folders_to_clone = [
            'advancement', 'function', 'predicate', 'item_modifier', 'recipe', 'loot_table', 'tag'
        ]

        # --- GUI Layout ---

        # Frame for directory selection
        dir_frame = tk.Frame(self, padx=10, pady=5)
        dir_frame.pack(fill=tk.X)
        
        self.dir_label = tk.Label(dir_frame, text="Root Directory:")
        self.dir_label.pack(side=tk.LEFT, padx=(0, 5))
        
        self.dir_entry = tk.Entry(dir_frame, textvariable=self.dir_entry_var, width=50)
        self.dir_entry.pack(side=tk.LEFT, fill=tk.X, expand=True)
        
        self.browse_button = tk.Button(dir_frame, text="Browse", command=self.browse_directory)
        self.browse_button.pack(side=tk.LEFT, padx=(5, 0))

        # Frame for buttons
        button_frame = tk.Frame(self, padx=10, pady=5)
        button_frame.pack(fill=tk.X)
        
        self.test_button = tk.Button(
            button_frame, text="Test", command=lambda: self.run_task(is_test_mode=True)
        )
        self.test_button.pack(side=tk.LEFT, expand=True, fill=tk.X, padx=(0, 5))
        
        self.run_button = tk.Button(
            button_frame, text="Overwrite and Clone", fg="red",
            command=lambda: self.run_task(is_test_mode=False)
        )
        self.run_button.pack(side=tk.LEFT, expand=True, fill=tk.X)
        
        # Spacer for visual consistency
        tk.Label(self).pack(fill=tk.BOTH, expand=True)

    def browse_directory(self):
        """Opens a file dialog to select the root directory."""
        initial_dir = self.dir_entry.get() if self.dir_entry.get() else os.getcwd()
        selected_dir = filedialog.askdirectory(initialdir=initial_dir)
        if selected_dir:
            self.dir_entry_var.set(selected_dir)
            self.save_path_to_settings()

    def save_path_to_settings(self):
        if "Settings" not in self.config:
            self.config.add_section("Settings")
        self.config.set("Settings", "release_tool_path", self.dir_entry_var.get())
        settings_folder = self.config.get("Settings", "save_path", fallback=str(Path(__file__).resolve().parent))
        settings_file = Path(settings_folder) / "dmtool_settings.ini"
        try:
            with open(settings_file, "w") as config_file:
                self.config.write(config_file)
        except Exception as e:
            self.logger.log(f"Error saving cloner path: {e}", log_type='error')

    def load_path_from_settings(self):
        saved_path = self.config.get("Settings", "release_tool_path", fallback="")
        if saved_path and os.path.isdir(saved_path):
            self.dir_entry_var.set(saved_path)

    def run_task(self, is_test_mode):
        """
        Executes the folder cloning logic based on the mode (test or real).
        """
        self.logger.clear_logs() # Clear logs before new operation
        
        root_dir = self.dir_entry_var.get()
        
        if not os.path.isdir(root_dir):
            messagebox.showerror("Error", f"The directory '{root_dir}' does not exist.")
            self.logger.log(f"Error: Directory not found - '{root_dir}'", log_type='error')
            return

        if not is_test_mode:
            if not messagebox.askyesno(
                "Confirmation",
                "Are you sure you want to overwrite and clone the folders? This action is permanent."
            ):
                self.logger.log("Operation cancelled by user.", log_type='warning')
                return

        self.logger.log("-----------------------------------------")
        self.logger.log("--- Starting Release Tool operation ---", log_type='info')
        self.logger.log(f"Mode: {'Test Run (No changes will be made)' if is_test_mode else 'Overwrite and Clone'}", log_type='info')
        self.logger.log(f"Root Directory: {root_dir}", log_type='info')
        self.logger.log(f"Target Folders: {', '.join(self.folders_to_clone)}", log_type='info')
        self.logger.log("-----------------------------------------")

        found_folders = False
        for dirpath, dirnames, filenames in os.walk(root_dir):
            for folder_name in dirnames:
                if folder_name in self.folders_to_clone:
                    found_folders = True
                    original_path = os.path.join(dirpath, folder_name)
                    new_path = os.path.join(dirpath, folder_name + 's')
                    
                    self.logger.log(f"Processing folder: '{original_path}'", log_type='info')

                    if os.path.exists(new_path):
                        self.logger.log(f"  -> Found existing folder: '{new_path}'", log_type='warning')
                        self.logger.log(f"  -> Deleting it to prepare for overwrite...", log_type='warning')
                        if not is_test_mode:
                            try:
                                shutil.rmtree(new_path)
                                self.logger.log("  -> Deletion successful.", log_type='success')
                            except OSError as e:
                                self.logger.log(f"  -> Error: Could not delete '{new_path}' - {e}", log_type='error')
                                continue

                    self.logger.log(f"  -> Cloning to '{new_path}'...", log_type='info')
                    if not is_test_mode:
                        try:
                            shutil.copytree(original_path, new_path)
                            self.logger.log("  -> Done.", log_type='success')
                        except shutil.Error as e:
                            self.logger.log(f"  -> Error: {e}", log_type='error')
                    
                    self.logger.log("-----------------------------------------")

        if not found_folders:
            self.logger.log("No target folders were found in the directory tree.", log_type='warning')
            self.logger.log("-----------------------------------------")

        self.logger.log("--- Release Tool operation complete ---", log_type='success')

if __name__ == "__main__":
    app = DatapackManagerApp()
    app.mainloop()