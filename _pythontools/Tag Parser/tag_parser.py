import tkinter as tk
from tkinter import ttk, filedialog, messagebox
import configparser
import re
import os
import threading
import time

class CodeParserApp(tk.Tk):
    """
    A GUI application for parsing code files based on regex signatures
    defined in a configuration file.
    """
    def __init__(self):
        super().__init__()
        self.title("Tag Parser v0.1-beta")
        self.geometry("1600x900")
        self.center_window()

        self.config_patterns = {}
        self.parsing_thread = None
        self.user_config_path = 'user_settings.ini'
        
        # Regex for standard tag format: THINGONE$thingtwo.three.four ThingFive
        # This regex is more specific to avoid capturing extra characters.
        self.statistics_pattern = re.compile(r'([A-Z0-9]+)\$([^"\s]+)\s?([^\s]+)?')
        
        # Regex for JSON tag format: {"name":"THINGONE$thingtwo.three.four","objective":"ThingFive"}
        self.statistics_json_pattern = re.compile(r'"name":"([A-Z0-9]+)\$([^"]+)","objective":"([^"]+)"')

        self.create_widgets()
        self.load_user_settings()

    def center_window(self):
        """Centers the main application window on the screen."""
        self.update_idletasks()
        width = self.winfo_width()
        height = self.winfo_height()
        screen_width = self.winfo_screenwidth()
        screen_height = self.winfo_screenheight()
        x = (screen_width // 2) - (width // 2)
        y = (screen_height // 2) - (height // 2)
        self.geometry(f'{width}x{height}+{x}+{y}')

    def create_widgets(self):
        """Builds all the main GUI components."""
        main_frame = ttk.Frame(self, padding="10")
        main_frame.pack(fill=tk.BOTH, expand=True)

        # Directory and Config file selection
        input_frame = ttk.LabelFrame(main_frame, text="Input", padding="10")
        input_frame.pack(fill=tk.X, pady=(0, 10))

        # Directory Path
        ttk.Label(input_frame, text="Code Directory:").grid(row=0, column=0, sticky="w", padx=5, pady=5)
        self.dir_path_entry = ttk.Entry(input_frame, width=50)
        self.dir_path_entry.grid(row=0, column=1, sticky="ew", padx=5, pady=5)
        ttk.Button(input_frame, text="Browse", command=self.browse_directory).grid(row=0, column=2, padx=5, pady=5)
        
        # Config File Path
        ttk.Label(input_frame, text="Config File:").grid(row=1, column=0, sticky="w", padx=5, pady=5)
        self.config_path_entry = ttk.Entry(input_frame, width=50)
        self.config_path_entry.grid(row=1, column=1, sticky="ew", padx=5, pady=5)
        ttk.Button(input_frame, text="Browse", command=self.browse_config_file).grid(row=1, column=2, padx=5, pady=5)

        input_frame.grid_columnconfigure(1, weight=1)
        
        # Action button and status label
        action_frame = ttk.Frame(main_frame, padding="10")
        action_frame.pack(fill=tk.X, pady=(0, 10))

        self.parse_button = ttk.Button(action_frame, text="Start Parsing", command=self.start_parsing)
        self.parse_button.pack(side=tk.LEFT, padx=(0, 10))

        self.status_label = ttk.Label(action_frame, text="Ready.")
        self.status_label.pack(side=tk.LEFT, fill=tk.X, expand=True)

        # Tabbed notebook for results
        self.notebook = ttk.Notebook(main_frame)
        self.notebook.pack(fill=tk.BOTH, expand=True)

    def load_user_settings(self):
        """Loads the last used directory and config file paths from a settings file."""
        user_config = configparser.ConfigParser()
        if os.path.exists(self.user_config_path):
            user_config.read(self.user_config_path)
            if 'Settings' in user_config:
                dir_path = user_config['Settings'].get('last_directory', '')
                config_path = user_config['Settings'].get('last_config_file', '')
                
                if dir_path:
                    self.dir_path_entry.insert(0, dir_path)
                if config_path:
                    self.config_path_entry.insert(0, config_path)

    def save_user_settings(self):
        """Saves the current directory and config file paths to a settings file."""
        user_config = configparser.ConfigParser()
        user_config['Settings'] = {
            'last_directory': self.dir_path_entry.get(),
            'last_config_file': self.config_path_entry.get()
        }
        with open(self.user_config_path, 'w') as f:
            user_config.write(f)

    def browse_directory(self):
        """Opens a dialog to select the code directory."""
        initial_dir = self.dir_path_entry.get() or os.getcwd()
        directory = filedialog.askdirectory(initialdir=initial_dir)
        if directory:
            self.dir_path_entry.delete(0, tk.END)
            self.dir_path_entry.insert(0, directory)
            self.save_user_settings()

    def browse_config_file(self):
        """Opens a dialog to select the configuration file."""
        initial_dir = os.path.dirname(self.config_path_entry.get()) or os.getcwd()
        file_path = filedialog.askopenfilename(initialdir=initial_dir, defaultextension=".ini", filetypes=[("INI files", "*.ini"), ("All files", "*.*")])
        if file_path:
            self.config_path_entry.delete(0, tk.END)
            self.config_path_entry.insert(0, file_path)
            self.save_user_settings()
            
    def start_parsing(self):
        """
        Initiates the parsing process in a separate thread to prevent
        the GUI from freezing.
        """
        self.parse_button.config(state=tk.DISABLED)
        self.status_label.config(text="Parsing...")
        
        # Destroy existing tabs before starting a new parse
        for tab in self.notebook.winfo_children():
            tab.destroy()
            
        self.parsing_thread = threading.Thread(target=self.parse_files)
        self.parsing_thread.daemon = True
        self.parsing_thread.start()

    def load_config(self):
        """
        Loads and compiles regex patterns from the specified INI file.
        Returns a dictionary of compiled regex objects.
        """
        config = configparser.ConfigParser()
        config_file_path = self.config_path_entry.get()

        if not os.path.exists(config_file_path):
            messagebox.showerror("Error", f"Configuration file not found: {config_file_path}")
            return None

        try:
            config.read(config_file_path)
            self.config_patterns = {section: re.compile(config[section].get('regex', ''))
                                    for section in config.sections() if config[section].get('regex')}
            return self.config_patterns
        except Exception as e:
            messagebox.showerror("Error", f"Failed to parse config file: {e}")
            return None

    def create_tabs(self, all_matches):
        """Creates a tab and Treeview for each regex signature."""
        self.treeviews = {}
        
        # Create tabs for each regex signature
        for signature, matches in all_matches.items():
            tab_frame = ttk.Frame(self.notebook, padding="10")
            # Add the count to the tab title
            self.notebook.add(tab_frame, text=f"{signature} ({len(matches)})")

            # Updated column headings for the table
            tree = ttk.Treeview(tab_frame, columns=("Match", "File", "Line #", "Line"), show="headings")
            tree.heading("Match", text="Match")
            tree.heading("File", text="File")
            tree.heading("Line #", text="Line #")
            tree.heading("Line", text="Line")

            # Adjust column widths
            tree.column("Match", width=120, anchor="w")
            tree.column("File", width=250, anchor="w")
            tree.column("Line #", width=60, anchor="center")
            tree.column("Line", width=400, anchor="w")

            tree.pack(fill=tk.BOTH, expand=True)

            # Scrollbars
            vsb = ttk.Scrollbar(tab_frame, orient="vertical", command=tree.yview)
            hsb = ttk.Scrollbar(tab_frame, orient="horizontal", command=tree.xview)
            tree.configure(yscrollcommand=vsb.set, xscrollcommand=hsb.set)
            vsb.pack(side="right", fill="y")
            hsb.pack(side="bottom", fill="x")

            self.treeviews[signature] = tree

        # Create the new Statistics tab
        stats_tab_frame = ttk.Frame(self.notebook, padding="10")
        self.notebook.add(stats_tab_frame, text="Statistics")
        self.stats_treeview = ttk.Treeview(stats_tab_frame)
        self.stats_treeview.pack(fill=tk.BOTH, expand=True)

        self.update() # Update the GUI to show tabs

    def parse_files(self):
        """
        Walks the specified directory and searches for regex matches.
        Collects and sorts all matches before displaying them.
        """
        dir_path = self.dir_path_entry.get()
        if not os.path.isdir(dir_path):
            messagebox.showerror("Error", "Invalid directory path.")
            self.reset_ui()
            return

        self.load_config()
        
        all_matches = {signature: [] for signature in self.config_patterns.keys()}
        statistics_data = {}
        thing_five_map = {}
        total_files = sum(len(files) for _, _, files in os.walk(dir_path))
        files_processed = 0

        for root, _, files in os.walk(dir_path):
            for file_name in files:
                files_processed += 1
                self.status_label.config(text=f"Parsing: {files_processed}/{total_files} files...")
                
                file_path = os.path.join(root, file_name)
                
                # Format file path to be relative to the selected code directory
                display_file_path = os.path.relpath(file_path, dir_path)

                try:
                    with open(file_path, 'r', encoding='utf-8', errors='ignore') as f:
                        for line_num, line in enumerate(f, 1):
                            # Skip lines that are comments
                            if line.strip().startswith('#'):
                                continue

                            # Flag to prevent double-counting of JSON matches
                            json_match_found = False
                                
                            # Search for generic pattern for statistics (JSON format) first
                            for match in self.statistics_json_pattern.finditer(line):
                                thing_one = match.group(1)
                                thing_path = match.group(2)
                                thing_five = match.group(3)
                                
                                # Use the objective as the definitive top-level key
                                if thing_five not in statistics_data:
                                    statistics_data[thing_five] = {}

                                current_level = statistics_data[thing_five]
                                path_parts = thing_path.split('.')
                                
                                if not path_parts:
                                    path_parts.append("unspecified")

                                if thing_one not in current_level:
                                    current_level[thing_one] = {}
                                
                                current_level = current_level[thing_one]

                                for part in path_parts:
                                    if part not in current_level:
                                        current_level[part] = {"count": 0}
                                    current_level[part]["count"] += 1
                                    current_level = current_level[part]

                                json_match_found = True
                            
                            # Only search for the old pattern if no JSON matches were found on the line
                            if not json_match_found:
                                for match in self.statistics_pattern.finditer(line):
                                    thing_one = match.group(1)
                                    thing_path = match.group(2)
                                    thing_five = match.group(3)
                                    
                                    # Use a placeholder for the top-level group if not present
                                    if not thing_five:
                                        thing_five = thing_five_map.get(thing_one, "Uncategorized")
                                    else:
                                        thing_five_map[thing_one] = thing_five
                                    
                                    if thing_five not in statistics_data:
                                        statistics_data[thing_five] = {}

                                    # Build the nested dictionary structure
                                    current_level = statistics_data[thing_five]
                                    path_parts = thing_path.split('.')
                                    
                                    # Ensure at least one part for the hierarchy
                                    if not path_parts:
                                        path_parts.append("unspecified")

                                    if thing_one not in current_level:
                                        current_level[thing_one] = {}
                                    
                                    current_level = current_level[thing_one]

                                    # Recursively build the hierarchy based on path_parts
                                    for part in path_parts:
                                        if part not in current_level:
                                            current_level[part] = {"count": 0}
                                        current_level[part]["count"] += 1
                                        current_level = current_level[part]

                            # Search for specific patterns from the config file
                            for signature, pattern in self.config_patterns.items():
                                for match in pattern.finditer(line):
                                    all_matches[signature].append((display_file_path, line_num, line.strip(), match.group(0)))
                                        
                except IOError as e:
                    print(f"Error reading file {file_path}: {e}")
                except Exception as e:
                    print(f"An unexpected error occurred: {e}")

        # Now that all matches are found, create the tabs with the counts
        self.create_tabs(all_matches)
        
        # Sort and populate tables
        for signature, matches in all_matches.items():
            # Sort by file path (index 0) and then line number (index 1)
            matches.sort(key=lambda x: (x[0], x[1]))
            
            tree = self.treeviews[signature]
            for match in matches:
                # The values are: match, file, line #, line
                tree.insert("", "end", values=(match[3], match[0], match[1], match[2]))

        # Populate the statistics tab
        self.populate_statistics_tab(statistics_data)
        
        self.status_label.config(text=f"Parsing complete. Found {sum(len(tree.get_children()) for tree in self.treeviews.values())} matches.")
        self.reset_ui()

    def populate_statistics_tab(self, data):
        """Populates the statistics Treeview with hierarchical data."""
        self.stats_treeview.delete(*self.stats_treeview.get_children())
        
        def insert_nodes(parent_id, node_data):
            total_count = 0
            if "count" in node_data:
                return node_data["count"]
            
            for key, value in sorted(node_data.items()):
                node_id = self.stats_treeview.insert(parent_id, "end", text=key)
                child_count = insert_nodes(node_id, value)
                self.stats_treeview.item(node_id, text=f"{key} ({child_count})")
                total_count += child_count
            
            return total_count

        insert_nodes("", data)

    def reset_ui(self):
        """Resets the UI state after parsing is complete."""
        self.parse_button.config(state=tk.NORMAL)
        # Ensure this is called in the main thread
        self.after(100, lambda: self.status_label.config(text="Done."))

if __name__ == "__main__":
    app = CodeParserApp()
    app.mainloop()
