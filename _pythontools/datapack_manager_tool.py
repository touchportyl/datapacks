import os
import re
import shutil
import tkinter as tk
from tkinter import filedialog, ttk, scrolledtext, messagebox, font as tk_font
from datetime import datetime
from configparser import ConfigParser
from pathlib import Path
from threading import Thread, Lock
import json
import difflib
import hashlib

class DatapackManagerApp(tk.Tk):
  """
  Main application for the Datapack Manager Tool.
  """
  VERSION = "mc1.21.10"
  
  def __init__(self):
    super().__init__()
    self.title(f"Datapack Manager Tool {self.VERSION}")
    
    # Define window dimensions
    window_width = 1200
    window_height = 700

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
    style.configure('TButton', font=(None, 12, 'bold'), borderwidth=1, relief="raised")
    style.map('TButton',
      foreground=[('active', 'black')],
      background=[('active', 'cyan'), ('pressed', 'blue')])
    style.configure('Custom.TButton', background='lightgreen', foreground='black', borderwidth=2)
    # Increased font size for readability
    style.configure("Treeview", font=(None, 11))
    style.configure("Treeview.Heading", font=(None, 12, 'bold'))
    style.configure('TLabel', font=(None, 12))
    style.configure('TEntry', font=(None, 12))

    self.notebook = ttk.Notebook(self)
    self.notebook.pack(expand=True, fill="both", padx=10, pady=10)

    # Create the LogFrame first so other frames can reference it
    self.log_frame = LogFrame(self.notebook)
    self.log_frame.pack(expand=True, fill="both")

    # Instantiate the other tool frames
    self.tag_analyzer_frame = TagAnalyzerFrame(self.notebook, self.config, self.log_frame)
    self.datapack_explorer_frame = DatapackExplorerFrame(self.notebook, self.config, self.log_frame)
    self.project_creator_frame = ProjectCreatorFrame(self.notebook, self.config, self.log_frame)
    self.framework_updater_frame = FrameworkUpdaterFrame(self.notebook, self.config, self.log_frame)
    self.settings_frame = SettingsFrame(self.notebook, self.config, self.tag_analyzer_frame, self.datapack_explorer_frame)

    # Add all frames to the main notebook
    self.notebook.add(self.datapack_explorer_frame, text="Datapack Explorer")
    self.notebook.add(self.tag_analyzer_frame, text="Tag Analyzer")
    self.notebook.add(self.project_creator_frame, text="Project Creator")
    self.notebook.add(self.framework_updater_frame, text="Framework Updater")
    self.notebook.add(self.log_frame, text="Logs")
    self.notebook.add(self.settings_frame, text="Settings")
  
    # Set the first tab (Datapacks) as the initial selection
    self.notebook.select(0)
  
    self.tag_analyzer_frame.load_path_from_settings()
    self.datapack_explorer_frame.load_path_from_settings()
    self.project_creator_frame.load_path_from_settings()
    self.framework_updater_frame.load_paths_from_settings()
    
    # Auto-scan datapacks if valid folder is already set
    self.after_idle(self._auto_scan_datapacks)

  def _auto_scan_datapacks(self):
    """Automatically scan datapacks if a valid folder is set in cloner_frame."""
    if hasattr(self.datapack_explorer_frame, 'dir_entry_var'):
      root_dir = self.datapack_explorer_frame.dir_entry_var.get()
      if root_dir and os.path.isdir(root_dir):
        self.datapack_explorer_frame.scan_and_display_datapacks()

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
    self.log_area = scrolledtext.ScrolledText(self, wrap=tk.WORD, state=tk.DISABLED, height=15, font=(None, 11))
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

    # Title section
    title_frame = ttk.Frame(self)
    title_frame.pack(fill="x", padx=10, pady=5)
    
    title_label = ttk.Label(title_frame, text="Application Settings", 
                          font=('Arial', 14, 'bold'))
    title_label.pack(anchor="w")
    
    desc_label = ttk.Label(title_frame, 
                         text="Configure application paths and default directories.",
                         font=('Arial', 10))
    desc_label.pack(anchor="w", pady=(0, 10))

    # Settings folder location section
    settings_section = ttk.Frame(self)
    settings_section.pack(fill="x", padx=10, pady=5)
    
    self.label = ttk.Label(settings_section, text="Settings Folder Location:")
    self.label.pack(anchor="w", pady=(10, 5))

    self.entry_var = tk.StringVar(value=self.config.get("Settings", "save_path", fallback=""))
    self.path_entry = ttk.Entry(settings_section, textvariable=self.entry_var, width=70)
    self.path_entry.pack(fill="x", pady=5)
    self.path_entry.config(state='readonly')

    self.browse_button = ttk.Button(settings_section, text="Browse Settings Folder", command=self.browse_path)
    self.browse_button.pack(pady=5)

    # Root directory section
    root_section = ttk.Frame(self)
    root_section.pack(fill="x", padx=10, pady=5)
    
    self.root_label = ttk.Label(root_section, text="Default Root Directory:")
    self.root_label.pack(anchor="w", pady=(10, 5))
    
    root_desc = ttk.Label(root_section, text="All browse dialogs will default to this directory", 
                         font=('Arial', 9), foreground='gray')
    root_desc.pack(anchor="w")

    self.root_entry_var = tk.StringVar(value=self.config.get("Settings", "root_directory", fallback=""))
    self.root_path_entry = ttk.Entry(root_section, textvariable=self.root_entry_var, width=70)
    self.root_path_entry.pack(fill="x", pady=5)

    self.browse_root_button = ttk.Button(root_section, text="Browse Root Directory", command=self.browse_root_path)
    self.browse_root_button.pack(pady=5)

    self.status_label = ttk.Label(self, text="")
    self.status_label.pack(pady=10)

  def browse_path(self):
    initial_dir = self.config.get("Settings", "save_path", fallback=str(Path(__file__).resolve().parent))
    if not os.path.isdir(initial_dir):
      initial_dir = str(Path(__file__).resolve().parent)

    directory = filedialog.askdirectory(initialdir=initial_dir, title="Select Settings Folder")
    if directory:
      self.entry_var.set(directory)
      self.save_settings(directory)
      self.status_label.config(text=f"Settings path updated to {directory}", foreground="green")
      self.master.settings_file_path = Path(directory) / "dmtool_settings.ini"

  def browse_root_path(self):
    """Browse for the root directory that will be used as default for all browse dialogs"""
    current_root = self.config.get("Settings", "root_directory", fallback="")
    initial_dir = current_root if current_root and os.path.isdir(current_root) else str(Path.home())

    directory = filedialog.askdirectory(initialdir=initial_dir, title="Select Default Root Directory")
    if directory:
      self.root_entry_var.set(directory)
      self.save_root_directory(directory)
      self.status_label.config(text=f"Root directory updated to {directory}", foreground="green")

  def save_root_directory(self, directory):
    """Save the root directory setting"""
    try:
      if not self.config.has_section('Settings'):
        self.config.add_section('Settings')
      
      self.config.set("Settings", "root_directory", directory)
      
      # Save to current settings file
      settings_file = Path(self.entry_var.get()) / "dmtool_settings.ini" if self.entry_var.get() else Path(__file__).parent / "dmtool_settings.ini"
      with open(settings_file, "w") as config_file:
        self.config.write(config_file)
        
    except Exception as e:
      self.status_label.config(text=f"Error saving root directory: {e}", foreground="red")

  def get_root_directory(self):
    """Get the configured root directory or fall back to a sensible default"""
    if hasattr(self, 'settings_frame') and hasattr(self.settings_frame, 'root_entry_var'):
      root_dir = self.settings_frame.root_entry_var.get()
      if root_dir and os.path.isdir(root_dir):
        return root_dir
    
    # Fall back to config file setting
    root_dir = self.config.get("Settings", "root_directory", fallback="")
    if root_dir and os.path.isdir(root_dir):
      return root_dir
    
    # Final fallback to current script directory
    return str(Path(__file__).resolve().parent)

  def save_settings(self, directory):
    self.config.set("Settings", "save_path", directory)
    self.config.set("Settings", "tag_parser_path", self.parser_frame.target_path_var.get())
    self.config.set("Settings", "release_tool_path", self.cloner_frame.dir_entry_var.get())
    self.config.set("Settings", "release_output_path", self.cloner_frame.release_output_path_var.get())
    
    # Save root directory setting if it exists
    if hasattr(self.settings_frame, 'root_entry_var') and self.settings_frame.root_entry_var.get():
      self.config.set("Settings", "root_directory", self.settings_frame.root_entry_var.get())
    
    settings_file = Path(directory) / "dmtool_settings.ini"
    try:
      with open(settings_file, "w") as config_file:
        self.config.write(config_file)
    except Exception as e:
      self.status_label.config(text=f"Error saving settings: {e}", log_type='error')

class DatapackFrame(ttk.Frame):
  def __init__(self, parent, config):
    super().__init__(parent)
    self.config = config
    self.notebook = ttk.Notebook(self)
    self.notebook.pack(expand=True, fill="both")
    self.datapack_notebooks = {} # Dictionary to hold internal notebooks
    self.internal_notebooks = {} # Dictionary to hold tag type notebooks
    self.trees = {} # Dictionary to hold Treeview widgets for each tab
    self.tag_statistics = {} # Dictionary to hold tag statistics trees
    self.tag_counts = {} # Dictionary to count tags per (datapack, internal) scope

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
    
    # Create the Tag Statistics tab first
    self.create_tag_statistics_tab(datapack_name, internal_name, tag_notebook)
    
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

  def create_tag_statistics_tab(self, datapack_name, internal_name, tag_notebook):
    """Create the Tag Statistics tab as the first tab in each internal notebook"""
    stats_frame = ttk.Frame(tag_notebook)
    
    # Create a Treeview for tag statistics
    stats_tree = ttk.Treeview(stats_frame, columns=("Tag", "Count", "Type"), show="headings")
    stats_tree.heading("Tag", text="Tag")
    stats_tree.heading("Count", text="Count")
    stats_tree.heading("Type", text="Type")
    
    # Create scrollbars for this treeview
    v_scrollbar = ttk.Scrollbar(stats_frame, orient="vertical", command=stats_tree.yview)
    h_scrollbar = ttk.Scrollbar(stats_frame, orient="horizontal", command=stats_tree.xview)
    stats_tree.configure(yscrollcommand=v_scrollbar.set, xscrollcommand=h_scrollbar.set)
    
    v_scrollbar.pack(side="right", fill="y")
    h_scrollbar.pack(side="bottom", fill="x")
    stats_tree.pack(side="left", expand=True, fill="both")

    tag_notebook.add(stats_frame, text="Tag Statistics")
    self.tag_statistics[(datapack_name, internal_name)] = stats_tree
    
    # Initialize tag counts for this scope
    self.tag_counts[(datapack_name, internal_name)] = {}
    
    return stats_tree

  def add_tag_to_statistics(self, datapack_name, internal_name, tag, tag_type):
    """Add a tag to the statistics count for the given scope"""
    scope_key = (datapack_name, internal_name)
    
    if scope_key not in self.tag_counts:
      self.tag_counts[scope_key] = {}
    
    if tag not in self.tag_counts[scope_key]:
      self.tag_counts[scope_key][tag] = {'count': 0, 'type': tag_type}
    
    self.tag_counts[scope_key][tag]['count'] += 1

  def update_tag_statistics(self, datapack_name, internal_name):
    """Update the Tag Statistics tree view with current counts"""
    scope_key = (datapack_name, internal_name)
    
    if scope_key not in self.tag_statistics or scope_key not in self.tag_counts:
      return
    
    stats_tree = self.tag_statistics[scope_key]
    tag_counts = self.tag_counts[scope_key]
    
    # Clear existing items
    for item in stats_tree.get_children():
      stats_tree.delete(item)
    
    # Add sorted tag statistics
    for tag, data in sorted(tag_counts.items()):
      stats_tree.insert("", "end", values=(tag, data['count'], data['type']))

class TagAnalyzerFrame(ttk.Frame):
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

    # Title section
    title_frame = ttk.Frame(self)
    title_frame.pack(fill="x", padx=10, pady=5)
    
    title_label = ttk.Label(title_frame, text="Datapack Tag Analyzer", 
                          font=('Arial', 14, 'bold'))
    title_label.pack(anchor="w")
    
    desc_label = ttk.Label(title_frame, 
                         text="Analyze and parse datapack tags, configurations, and function calls.",
                         font=('Arial', 10))
    desc_label.pack(anchor="w", pady=(0, 10))

    path_frame = ttk.Frame(self)
    path_frame.pack(fill="x", padx=10, pady=5)

    ttk.Label(path_frame, text="Target Folder:").pack(side="left")
    self.path_entry = ttk.Entry(path_frame, textvariable=self.target_path_var, width=60)
    self.path_entry.pack(side="left", expand=True, fill="x", padx=(5, 0))
    self.browse_button = ttk.Button(path_frame, text="Browse", command=self.browse_folder)
    self.browse_button.pack(side="left", padx=(5, 0))

    # Button frame for Parse and Cancel
    button_frame = ttk.Frame(self)
    button_frame.pack(padx=10, pady=5)
    self.parse_button = ttk.Button(button_frame, text="Parse", command=self._start_parsing_thread, style='Custom.TButton')
    self.parse_button.pack(side="left", padx=(0, 5))
    self.cancel_button = ttk.Button(button_frame, text="Cancel", command=self._cancel_parsing, state='disabled')
    self.cancel_button.pack(side="left", padx=(0, 5))
    
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

    # Check if this is a Tag Statistics tab
    if active_tab_text == "Tag Statistics":
      # Find the statistics tree for this scope
      for (datapack, internal), stats_tree in self.datapack_frame.tag_statistics.items():
        if stats_tree.winfo_parent() == notebook.children[notebook.tab(active_tab_id, "text").lower()]:
          self._resize_columns(stats_tree)
          break
    else:
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
    self.datapack_frame.tag_statistics = {}
    self.datapack_frame.tag_counts = {}

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
    if re.match(r'z_[a-z]{2}_\d{3}_[tf]', tag):
      return "Config Tags"
    elif "$" in tag:
      parts = tag.split('$')
      if parts[0]:
        return parts[0].capitalize()
    elif re.match(r'[A-Z]{2}_', tag):
      return "Player Tags"
    return "Misc"

  def _threaded_parsing_task(self, target_path):
    pattern = r'z_[a-z]{2}_\d{3}_[tf]|[A-Z]{2}_[a-zA-Z0-9_]+|[A-Z]+\$[a-zA-Z0-9.]+'
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
        
        # Add tag to statistics
        self.datapack_frame.add_tag_to_statistics(datapack_name, internal_name, tag, tag_type)

    # Update all tag statistics trees after all tags have been processed
    for (datapack_name, internal_name) in self.datapack_frame.tag_statistics.keys():
      self.datapack_frame.update_tag_statistics(datapack_name, internal_name)

    for tree in self.datapack_frame.trees.values():
      self._resize_columns(tree)
      
    # Also resize columns for statistics trees
    for stats_tree in self.datapack_frame.tag_statistics.values():
      self._resize_columns(stats_tree)

    self.parse_button.config(text="Parse", state="normal")
    self.cancel_button.config(state="disabled")
    self.browse_button.config(state="normal")
    self.is_parsing = False
    
    if matches_found:
      self.logger.log("Parsing complete.", log_type='success')
    else:
      self.logger.log("No matches found.", log_type='warning')

class DatapackExplorerFrame(ttk.Frame):
  def __init__(self, parent, config, logger):
    super().__init__(parent)
    self.config = config
    self.logger = logger
    self.dir_entry_var = tk.StringVar()
    self.release_output_path_var = tk.StringVar()
    self.show_archived_var = tk.BooleanVar(value=False)  # Checkbox state for showing archived
    self.all_datapack_info = []  # Cache all datapack info to avoid rescanning
    self.stage_folders = {}  # Cache for detected development stage folders
    
    self.folders_to_clone = [
      'advancement', 'function', 'predicate', 'item_modifier', 'recipe', 'loot_table', 'entity_type'
    ]

    # --- GUI Layout ---

    # Title section
    title_frame = ttk.Frame(self)
    title_frame.pack(fill="x", padx=10, pady=5)
    
    title_label = ttk.Label(title_frame, text="Datapack Explorer & Manager", 
                          font=('Arial', 14, 'bold'))
    title_label.pack(anchor="w")
    
    desc_label = ttk.Label(title_frame, 
                         text="Browse and manage datapacks across the development pipeline stages.",
                         font=('Arial', 10))
    desc_label.pack(anchor="w", pady=(0, 10))

    # Frame for directory selection (Release Output)
    release_dir_frame = ttk.Frame(self)
    release_dir_frame.pack(fill="x", padx=10, pady=5)
    
    ttk.Label(release_dir_frame, text="Release Output Path:").pack(side="left", padx=(0, 5))
    self.release_output_path_entry = ttk.Entry(release_dir_frame, textvariable=self.release_output_path_var, width=50)
    self.release_output_path_entry.pack(side="left", fill="x", expand=True)
    
    self.browse_release_button = ttk.Button(release_dir_frame, text="Browse", command=self.browse_release_directory)
    self.browse_release_button.pack(side="left", padx=(5, 0))

    # Frame for directory selection (Datapack Root)
    dir_frame = ttk.Frame(self)
    dir_frame.pack(fill="x", padx=10, pady=5)
    
    self.dir_label = ttk.Label(dir_frame, text="Datapack Root Directory:")
    self.dir_label.pack(side="left", padx=(0, 5))
    
    self.dir_entry = ttk.Entry(dir_frame, textvariable=self.dir_entry_var, width=50)
    self.dir_entry.pack(side="left", fill="x", expand=True)
    
    self.browse_button = ttk.Button(dir_frame, text="Browse", command=self.browse_directory)
    self.browse_button.pack(side="left", padx=(5, 0))
    
    # Button to trigger the scan and display datapacks
    self.scan_button = ttk.Button(dir_frame, text="Scan Datapacks", command=self.scan_and_display_datapacks)
    self.scan_button.pack(side="left", padx=(5, 0))
    
    # Checkbox to toggle showing archived datapacks
    self.archived_checkbox = ttk.Checkbutton(dir_frame, text="Show Archived", 
                                          variable=self.show_archived_var,
                                          command=self.display_filtered_datapacks)
    self.archived_checkbox.pack(side="left", padx=(5, 0))

    # --- Two-row tab filter area ---
    # Top row: folder/stage filters (e.g., released, work in progress, archived)
    # Second row: datapack filters (group by display title / same-name grouping)
    self.current_stage_filter = None  # None or stage key string (lowercase), 'all' means no stage filter
    self.current_datapack_filter = None  # None or normalized key for datapack grouping
    self.datapack_choice_to_key = {}  # maps dropdown label -> normalized key

    self.tabs_frame = ttk.Frame(self)
    self.tabs_frame.pack(fill="x", padx=10, pady=(5, 0))

    # Stage notebook (top row)
    self.stage_notebook = ttk.Notebook(self.tabs_frame)
    self.stage_notebook.pack(fill="x")
    # Ensure there's always an 'All' tab
    all_stage_frame = ttk.Frame(self.stage_notebook)
    self.stage_notebook.add(all_stage_frame, text="All")
    self.stage_notebook.bind("<<NotebookTabChanged>>", lambda e: self._on_stage_tab_changed(e))

    # Datapack selector (second row) - replace tabs with a dropdown for grouping
    dp_select_frame = ttk.Frame(self.tabs_frame)
    dp_select_frame.pack(fill="x")
    ttk.Label(dp_select_frame, text="Datapack:").pack(side="left")
    self.datapack_choice_var = tk.StringVar()
    self.datapack_combo = ttk.Combobox(dp_select_frame, textvariable=self.datapack_choice_var, state="readonly", values=["All"])
    self.datapack_combo.pack(side="left", fill="x", expand=True, padx=(5, 0))
    self.datapack_combo.bind("<<ComboboxSelected>>", lambda e: self._on_datapack_selected(e))

    # --- Scrollable frame for datapack list ---
    self.canvas = tk.Canvas(self, borderwidth=0)
    self.scrollbar = ttk.Scrollbar(self, orient="vertical", command=self.canvas.yview)
    self.canvas.configure(yscrollcommand=self.scrollbar.set)

    self.scrollbar.pack(side="right", fill="y")
    self.canvas.pack(side="left", fill="both", expand=True, padx=10, pady=5)
    
    self.datapack_list_frame = ttk.Frame(self.canvas)
    self.canvas.create_window((0, 0), window=self.datapack_list_frame, anchor="nw")

    # Bind the frame's size to update the scroll region
    self.datapack_list_frame.bind("<Configure>", self.on_frame_configure)
    
    # Bind mouse wheel for scrolling
    self.canvas.bind("<Enter>", lambda e: self.canvas.bind_all('<MouseWheel>', self.on_mouse_wheel))
    self.canvas.bind("<Leave>", lambda e: self.canvas.unbind_all('<MouseWheel>'))

    self.load_path_from_settings()

  def on_frame_configure(self, event):
    """Update the canvas scroll region to fit the inner frame."""
    self.canvas.configure(scrollregion=self.canvas.bbox("all"))

  def on_mouse_wheel(self, event):
    """Scroll the canvas with the mouse wheel."""
    self.canvas.yview_scroll(-1 * int(event.delta / 120), "units")

  def browse_directory(self):
    """Opens a file dialog to select the root directory."""
    initial_dir = self.dir_entry_var.get() if self.dir_entry_var.get() else os.getcwd()
    selected_dir = filedialog.askdirectory(initialdir=initial_dir)
    if selected_dir:
      self.dir_entry_var.set(selected_dir)
      self.save_path_to_settings()
      self.scan_and_display_datapacks()

  def browse_release_directory(self):
    """Opens a file dialog to select the release output directory."""
    initial_dir = self.release_output_path_var.get() if self.release_output_path_var.get() else os.getcwd()
    selected_dir = filedialog.askdirectory(initialdir=initial_dir)
    if selected_dir:
      self.release_output_path_var.set(selected_dir)
      self.save_path_to_settings()

  def save_path_to_settings(self):
    if "Settings" not in self.config:
      self.config.add_section("Settings")
    self.config.set("Settings", "release_tool_path", self.dir_entry_var.get())
    self.config.set("Settings", "release_output_path", self.release_output_path_var.get())
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

    saved_release_path = self.config.get("Settings", "release_output_path", fallback="")
    if saved_release_path and os.path.isdir(saved_release_path):
      self.release_output_path_var.set(saved_release_path)
    else:
      # Default to a subfolder of the script's directory if no path is saved
      default_path = Path(__file__).resolve().parent / "1. released"
      self.release_output_path_var.set(str(default_path))

  def scan_and_display_datapacks(self):
    root_dir = self.dir_entry_var.get()
    if not os.path.isdir(root_dir):
      self.logger.log(f"Error: Directory not found - '{root_dir}'", log_type='error')
      return

    self.logger.log(f"Scanning for datapacks in '{root_dir}'...", log_type='info')
    
    # Detect development stage folders dynamically
    self._detect_stage_folders(root_dir)
    
    detected_datapacks = self.find_datapacks(root_dir)
    
    if not detected_datapacks:
      self.logger.log("No datapacks with a 'data' folder and 'pack.mcmeta' found.", log_type='warning')
      self.all_datapack_info = []
      self.display_filtered_datapacks()
      return

    self.logger.log(f"Found {len(detected_datapacks)} datapacks.", log_type='success')
    
    # Collect ALL datapack information (including archived)
    self.all_datapack_info = []
    
    for datapack_path in detected_datapacks:
      info = self._process_datapack_info(datapack_path)
      if info:  # Only exclude if there was an error processing, not based on status
        self.all_datapack_info.append(info)
    
    # Sort by display title (case-insensitive), but put active datapacks first
    self.all_datapack_info.sort(key=lambda x: (x['status_tag'] != 'active', x['display_title'].lower()))
    
    # Display filtered results
    # Build datapack tabs (second row) and then display
    try:
      self._build_datapack_tabs()
    except Exception:
      pass
    self.display_filtered_datapacks()

  def display_filtered_datapacks(self):
    """Display datapacks based on current filter settings without rescanning."""
    # Clear existing widgets
    for widget in self.datapack_list_frame.winfo_children():
      widget.destroy()
    
    if not self.all_datapack_info:
      tk.Label(self.datapack_list_frame, text="No datapacks found in the selected directory.", font=(None, 12)).pack(pady=10)
      return
    
    # Filter datapacks based on archived checkbox, stage notebook and datapack notebook
    filtered_datapacks = []
    for info in self.all_datapack_info:
      # archived checkbox still overrides
      if info['status_tag'] == 'archived' and not self.show_archived_var.get():
        continue

      # Stage filter (top notebook)
      if self.current_stage_filter:
        # Normalize stage key and info status
        sel = self.current_stage_filter.lower()
        info_status = (info.get('status_tag') or '').lower()
        if sel != info_status:
          continue

      # Datapack filter (second notebook): compare using normalized key
      if self.current_datapack_filter:
        title_norm = re.sub(r'[^A-Za-z]+', '', info.get('display_title', '')).lower()
        if title_norm != self.current_datapack_filter:
          continue

      filtered_datapacks.append(info)
    
    if not filtered_datapacks:
      message = "No datapacks to display with current filters." if self.all_datapack_info else "No datapacks found."
      tk.Label(self.datapack_list_frame, text=message, font=(None, 12)).pack(pady=10)
      return
    
    # Display filtered datapacks
    for info in filtered_datapacks:
      self._display_datapack_info(info)

  # --- New: two-row tab support and callbacks ---
  def _build_stage_tabs(self):
    """Populate the top stage notebook based on detected stage_folders."""
    # Clear existing tabs
    for tab_id in list(self.stage_notebook.tabs()):
      self.stage_notebook.forget(tab_id)

    # Always have 'All' first
    all_frame = ttk.Frame(self.stage_notebook)
    self.stage_notebook.add(all_frame, text="All")

    # Add detected stages sorted by their numeric prefix in the folder name (e.g., '1. released')
    def _extract_number(folder_name):
      m = re.match(r'^(\d+)\.', folder_name.strip())
      if m:
        return int(m.group(1))
      return 9999

    # stage_folders maps stage_key -> folder_name (e.g., 'released' -> '1. released')
    items = list(self.stage_folders.items())
    items.sort(key=lambda kv: _extract_number(kv[1]))
    for stage_key, folder_name in items:
      frame = ttk.Frame(self.stage_notebook)
      # Use folder display (without the numeric prefix) for nicer tab labels when possible
      label = re.sub(r'^\d+\.\s*', '', folder_name).title() if folder_name else stage_key.title()
      self.stage_notebook.add(frame, text=label)

    # Reset filter
    self.current_stage_filter = None
    self.stage_notebook.select(0)

  def _build_datapack_tabs(self):
    """Populate the datapack dropdown with grouped names.

    Groups are created by normalizing display titles to letters-only lowercase.
    """
    def _normalize(name):
      return re.sub(r'[^A-Za-z]+', '', (name or '')).lower()

    groups = {}
    if self.all_datapack_info:
      for info in self.all_datapack_info:
        title = info.get('display_title', '')
        key = _normalize(title)
        groups.setdefault(key, []).append(title)

    # Build choices list for the combobox (start with 'All')
    # Display the human-readable extracted display title as the dropdown label
    # while mapping that label back to the normalized key used for filtering.
    choices = ['All']
    self.datapack_choice_to_key = {}

    for key in sorted(groups.keys()):
      # Choose a representative display title for this group (first occurrence)
      rep_title = groups[key][0] if groups.get(key) else key

      # Strip common version suffixes from the representative title so the
      # dropdown shows the extracted name without the version. Handle cases
      # like:
      #   - 'My Datapack [v1.02.00]'
      #   - 'MyDatapack-v1.02.00' or 'MyDatapack v1.02.00'
      rep_clean = rep_title
      # Remove bracketed version: [v1.02.00] or [1.02.00]
      rep_clean = re.sub(r"\s*\[v?\d+\.\d+\.\d+\]$", "", rep_clean)
      # Remove hyphen/space/underscore version suffix: -v1.02.00 or v1.02.00
      rep_clean = re.sub(r"[-_\s]*v?\d+\.\d+\.\d+$", "", rep_clean)
      rep_clean = rep_clean.strip()

      # Use the cleaned representative title for display but map back to the
      # normalized key for filtering.
      display_label = rep_clean if rep_clean else key
      choices.append(display_label)
      self.datapack_choice_to_key[display_label] = key

    try:
      self.datapack_combo['values'] = choices
      self.datapack_choice_var.set('All')
    except Exception:
      # If the combobox isn't available (rare), quietly continue
      pass

    self.current_datapack_filter = None

  def _on_stage_tab_changed(self, event):
    try:
      widget = event.widget
      tab_id = widget.select()
      tab_text = widget.tab(tab_id, 'text')
      if tab_text.lower() == 'all':
        self.current_stage_filter = None
      else:
        # normalize to match keys in stage_folders
        self.current_stage_filter = tab_text.lower()
      self.display_filtered_datapacks()
    except Exception:
      pass

  def _on_datapack_selected(self, event):
    try:
      choice = self.datapack_choice_var.get()
      if choice == 'All' or not choice:
        self.current_datapack_filter = None
      else:
        # Map the displayed choice back to the normalized key
        norm = self.datapack_choice_to_key.get(choice)
        if not norm:
          norm = re.sub(r'[^A-Za-z]+', '', choice).lower()
        self.current_datapack_filter = norm
      self.display_filtered_datapacks()
    except Exception:
      pass
  def _process_datapack_info(self, datapack_path):
    """Process a single datapack and return its information dictionary."""
    # Get the full folder name, e.g., 'DimensionalDoors-v3.01.04'
    folder_name = os.path.basename(datapack_path)
    
    # Determine status tag based on folder structure
    status_tag = self._get_status_tag(datapack_path)
    
    # Always process ALL datapacks regardless of archived checkbox state
    # Filtering happens in display_filtered_datapacks(), not during collection
    
    # Parse pack.mcmeta for basic info and validation
    pack_mcmeta_path = os.path.join(datapack_path, 'pack.mcmeta')
    pack_format = None
    pack_description = ""
    
    try:
      with open(pack_mcmeta_path, 'r', encoding='utf-8') as f:
        pack_data = json.load(f)
        pack_format = pack_data.get('pack', {}).get('pack_format')
        pack_description = pack_data.get('pack', {}).get('description', '')
    except (FileNotFoundError, json.JSONDecodeError, KeyError) as e:
      self.logger.log(f"Could not parse pack.mcmeta for '{folder_name}': {e}", log_type='warning')
    
    # Use a regex to separate the name and version from the folder name
    # This handles both cases: a valid name with a version, or just the folder name
    match = re.search(r'(.+?)-([vV]\d+\.\d+\.\d+)$', folder_name)
    if match:
        raw_name = match.group(1)
        raw_version = match.group(2)
        base_namespace = raw_name
    else:
        raw_name = folder_name
        raw_version = ""
        base_namespace = folder_name
    
    display_title = raw_name
    display_description = pack_description
    
    # Find the main datapack namespace by looking for advancement files
    namespace_found = None
    advancement_data = None
    
    # Look for advancement files in potential namespaces
    data_path = os.path.join(datapack_path, 'data')
    if os.path.exists(data_path):
      potential_namespaces = [
        base_namespace.lower(),
        raw_name.lower(),
        folder_name.lower()
      ]
      
      # Add any subdirectories in data/ as potential namespaces (excluding minecraft, datapackmanager*)
      try:
        for item in os.listdir(data_path):
          item_path = os.path.join(data_path, item)
          if os.path.isdir(item_path) and item not in ['minecraft'] and not item.startswith('datapackmanager'):
            if item not in potential_namespaces:
              potential_namespaces.append(item)
      except OSError:
        pass
      
      # Try to find advancement files in these namespaces
      for namespace in potential_namespaces:
        if namespace_found:
          break
          
        namespace_path = os.path.join(data_path, namespace)
        if not os.path.exists(namespace_path):
          continue
          
        # Check both 'advancement' and 'advancements' folders with namespace.json
        for adv_folder in ['advancement', 'advancements']:
          advancement_file = os.path.join(namespace_path, adv_folder, f'{namespace}.json')
          if os.path.exists(advancement_file):
            try:
              with open(advancement_file, 'r', encoding='utf-8') as f:
                advancement_data = json.load(f)
                namespace_found = namespace
                break
            except (json.JSONDecodeError, IOError):
              continue
          
        if namespace_found:
          break
    
    # Extract title and description from advancement data if found
    if advancement_data:
      title_data = advancement_data.get('display', {}).get('title', {})
      desc_data = advancement_data.get('display', {}).get('description', {})

      if title_data:
        if isinstance(title_data, dict):
          display_title = title_data.get('text', str(title_data))
        else:
          display_title = str(title_data)
      
      if desc_data:
        if isinstance(desc_data, dict):
          display_description = desc_data.get('text', str(desc_data))
        else:
          display_description = str(desc_data)
    
    # Decide on the final title format
    if display_title and display_title != folder_name:
      if raw_version and not display_title.strip().endswith(raw_version):
        formatted_title = f"{display_title} [{raw_version}]"
      else:
        formatted_title = display_title
    else:
      formatted_title = folder_name

    return {
      'datapack_path': datapack_path,
      'folder_name': folder_name,
      'display_title': formatted_title,
      'display_description': display_description,
      'namespace_found': namespace_found,
      'pack_format': pack_format,
      'raw_version': raw_version,
      'status_tag': status_tag
    }

  def _display_datapack_info(self, info):
    """Display a single datapack's information in the GUI."""
    # Create a new frame for this datapack's details and button
    # Use light green background for active datapacks
    bg_color = "#E8F5E8" if info['status_tag'] == 'active' else None
    
    datapack_frame = tk.Frame(self.datapack_list_frame, borderwidth=2, relief="groove", 
                             padx=10, pady=5, bg=bg_color)
    datapack_frame.pack(fill=tk.X, padx=5, pady=5, anchor='w')
    
    # Configure the frame to expand properly
    datapack_frame.grid_columnconfigure(0, weight=1)
    
    # Create a sub-frame for the labels to align them correctly
    label_frame = tk.Frame(datapack_frame, bg=bg_color)
    label_frame.grid(row=0, column=0, sticky='ew', padx=5, pady=5)
    
    # Create button frame for status dropdown and release button
    button_frame = tk.Frame(datapack_frame)
    button_frame.grid(row=0, column=1, sticky='e', padx=5, pady=5)
    
    # Release button for export functionality
    release_button = tk.Button(
        button_frame,
        text="Release",
        command=lambda: self.package_single_datapack(info['datapack_path']),
        bg='#4CAF50',
        fg='white',
        font=(None, 9, 'bold')
    )
    release_button.pack(side=tk.RIGHT, padx=(5, 0))
    
    # Trim button to remove cloned folders
    has_cloned = self._has_cloned_folders(info['datapack_path'])
    trim_button = tk.Button(
        button_frame,
        text="Trim",
        command=lambda: self.trim_single_datapack(info['datapack_path']),
        bg='#FF9800' if has_cloned else '#CCCCCC',
        fg='white' if has_cloned else '#888888',
        font=(None, 9, 'bold'),
        state='normal' if has_cloned else 'disabled'
    )
    trim_button.pack(side=tk.RIGHT, padx=(5, 0))
    
    # Clone button to create cloned folders
    clone_button = tk.Button(
        button_frame,
        text="Clone",
        command=lambda: self.clone_single_datapack(info['datapack_path']),
        bg='#2196F3',
        fg='white',
        font=(None, 9, 'bold')
    )
    clone_button.pack(side=tk.RIGHT, padx=(5, 0))
    
    # Only show status dropdown if datapack is not active
    if info['status_tag'] != 'active':
      # The Status dropdown (excluding 'released' since that's handled by the release button)
      status_var = tk.StringVar(value=info['status_tag'])
      
      # Use dynamically detected stage folders for dropdown values, excluding 'active'
      dropdown_values = [k for k in self.stage_folders.keys() if k not in ['active']]
      # Remove 'archived' if not showing archived datapacks
      if not self.show_archived_var.get() and 'archived' in dropdown_values:
        dropdown_values = [v for v in dropdown_values if v != 'archived']
      
      status_dropdown = ttk.Combobox(
          button_frame,
          textvariable=status_var,
          values=dropdown_values,
          state="readonly",
          width=18
      )
      status_dropdown.pack(side=tk.RIGHT, padx=(0, 5))
      
      # Bind the dropdown change event
      status_dropdown.bind("<<ComboboxSelected>>", 
                          lambda event: self._move_datapack_to_folder(info['datapack_path'], status_var.get()))
    
    # Display the formatted title with status tag, left-aligned and bold
    title_with_status = f"{info['display_title']} [{info['status_tag']}]"
    title_label = tk.Label(label_frame, text=title_with_status, anchor="w", 
                         font=(None, 12, 'bold'), justify=tk.LEFT, bg=bg_color)
    title_label.pack(anchor='w')
    
    # Display the description below, left-aligned
    if info['display_description']:
      description_label = tk.Label(label_frame, text=info['display_description'], anchor="w", 
                                 font=(None, 10), wraplength=500, justify=tk.LEFT, bg=bg_color)
      description_label.pack(anchor='w')
    
    # Show namespace info if found
    if info['namespace_found']:
      # Extract all two-letter IDs by scanning for tag patterns in the datapack
      all_ids = self._extract_all_datapack_ids(info['datapack_path'])
      ids_text = ", ".join(all_ids) if all_ids else "??"
      
      # Format pack format info
      format_text = f"Datapack Format: {info['pack_format']}" if info['pack_format'] is not None else "no pack format"
      
      namespace_label = tk.Label(label_frame, text=f"Namespace: {info['namespace_found']} | IDs: {ids_text} | {format_text}", anchor="w", 
                               font=(None, 9), fg='gray', justify=tk.LEFT, bg=bg_color)
      namespace_label.pack(anchor='w')

  def _get_status_tag(self, datapack_path):
    """Determine the status tag based on the folder structure."""
    # Get the path parts to determine which development stage folder this is in
    path_parts = Path(datapack_path).parts
    
    # Check if datapack is directly in root directory (active)
    root_dir = self.dir_entry_var.get()
    if root_dir and os.path.dirname(datapack_path) == root_dir:
      return "active"
    
    # Look for folders that match our detected stage folders
    for part in path_parts:
      for tag_name, folder_name in self.stage_folders.items():
        if part == folder_name:
          return tag_name
    
    # Fallback for datapacks not in numbered folders
    return "unknown"

  def _detect_stage_folders(self, root_dir):
    """Dynamically detect numbered development stage folders and update stage_folders dict."""
    self.stage_folders = {}
    
    try:
      for item in os.listdir(root_dir):
        item_path = os.path.join(root_dir, item)
        if os.path.isdir(item_path):
          # Check for numbered folders (e.g., "1. released", "2. ready for release")
          if re.match(r'^\d+\.', item):
            # Extract the tag name (remove number and period, strip whitespace)
            tag_name = re.sub(r'^\d+\.\s*', '', item).lower()
            self.stage_folders[tag_name] = item
          # Check for archived folder (may be numbered like "6. archived" or just "archived")
          elif item.lower() == 'archived' or re.search(r'archived', item.lower()):
            self.stage_folders['archived'] = item
      
      self.logger.log(f"Detected stage folders: {list(self.stage_folders.keys())}", log_type='info')
      # Build the top stage tabs now that we know stage folders
      try:
        self._build_stage_tabs()
      except Exception:
        pass
      
    except Exception as e:
      self.logger.log(f"Error detecting stage folders: {e}", log_type='error')
      # Fallback to default folder names
      self.stage_folders = {
        'released': '1. released',
        'ready for release': '2. ready for release', 
        'requires update': '3. requires update',
        'work in progress': '4. work in progress',
        'concepts': '5. concepts',
        'archived': '6. archived'
      }
      try:
        self._build_stage_tabs()
      except Exception:
        pass

  def _move_datapack_to_folder(self, datapack_path, new_status):
    """Move a datapack to the appropriate development stage folder."""
    # Get the current root directory
    root_dir = self.dir_entry_var.get()
    if not root_dir or not os.path.isdir(root_dir):
      self.logger.log("Error: Invalid root directory for moving datapack.", log_type='error')
      return
    
    # Use dynamically detected stage folders
    if new_status not in self.stage_folders:
      self.logger.log(f"Error: Unknown status '{new_status}'", log_type='error')
      return
    
    # Get the datapack folder name
    datapack_name = os.path.basename(datapack_path)
    
    # Construct the destination path
    destination_folder = os.path.join(root_dir, self.stage_folders[new_status])
    destination_path = os.path.join(destination_folder, datapack_name)
    
    # Check if destination already exists
    if os.path.exists(destination_path):
      response = messagebox.askyesno(
        "Datapack Already Exists",
        f"A datapack named '{datapack_name}' already exists in '{self.stage_folders[new_status]}'.\n\nDo you want to replace it?"
      )
      if not response:
        # Reset the dropdown to original value
        self.scan_and_display_datapacks()
        return
      else:
        # Remove existing datapack
        try:
          if os.path.isdir(destination_path):
            shutil.rmtree(destination_path)
          else:
            os.remove(destination_path)
        except OSError as e:
          self.logger.log(f"Error removing existing datapack: {e}", log_type='error')
          return
    
    # Create destination folder if it doesn't exist
    os.makedirs(destination_folder, exist_ok=True)
    
    # Move the datapack
    try:
      shutil.move(datapack_path, destination_path)
      self.logger.log(f"Moved '{datapack_name}' to '{self.stage_folders[new_status]}'", log_type='success')
      
      # Refresh the display
      self.scan_and_display_datapacks()
      
    except OSError as e:
      self.logger.log(f"Error moving datapack: {e}", log_type='error')

  def _extract_all_datapack_ids(self, datapack_path):
    """Extract all two-letter datapack IDs by scanning for tag patterns."""
    # Pattern to match the tag formats used in the parser
    pattern = r'z_([a-z]{2})_\d{3}_[tf]|([A-Z]{2})_[a-zA-Z0-9_]+'
    found_ids = set()  # Use set to avoid duplicates
    
    # Scan mcfunction files for these patterns
    for root, dirs, files in os.walk(datapack_path):
      # Skip system directories but don't exclude them completely since DM comes from there
      for file in files:
        if file.endswith('.mcfunction'):
          file_path = os.path.join(root, file)
          try:
            with open(file_path, 'r', encoding='utf-8') as f:
              for line in f:
                # Skip comment lines that start with #
                if line.strip().startswith('#'):
                  continue
                
                matches = re.findall(pattern, line)
                for match in matches:
                  # match is a tuple: (lowercase_id, uppercase_id)
                  if match[0]:  # z_xx_ pattern (config tags)
                    found_ids.add(match[0].upper())
                  elif match[1]:  # XX_ pattern (player tags)
                    found_ids.add(match[1])
          except (IOError, UnicodeDecodeError):
            continue
    
    # Convert to sorted list for consistent display
    id_list = sorted(list(found_ids))
    
    # If no IDs found, fallback to first two letters of folder name
    if not id_list:
      folder_name = os.path.basename(datapack_path)
      if len(folder_name) >= 2:
        id_list = [folder_name[:2].upper()]
    
    return id_list

  def find_datapacks(self, root_dir):
    """Find all directories containing both 'data' folder and 'pack.mcmeta' file."""
    datapack_paths = []
    for dirpath, dirnames, filenames in os.walk(root_dir):
      # Skip _standards folder (contains templates)
      if '_standards' in Path(dirpath).parts:
        continue
        
      if 'data' in dirnames and 'pack.mcmeta' in filenames:
        # Assuming a datapack root has a 'data' folder and 'pack.mcmeta'
        parent_path = os.path.dirname(os.path.join(dirpath, 'data'))
        datapack_paths.append(parent_path)
    return list(set(datapack_paths))

  def package_single_datapack(self, datapack_path):
    """
    New method to run the release logic on a single, specified datapack.
    """
    release_path_str = self.release_output_path_var.get()
    if not release_path_str or not os.path.isdir(release_path_str):
        self.logger.log("Error: Please select a valid Release Output Path first.", log_type='error')
        return

    if not messagebox.askyesno(
      "Confirmation",
      f"Are you sure you want to package '{os.path.basename(datapack_path)}'? This will clone folders and create a zip file."
    ):
      self.logger.log("Operation cancelled by user.", log_type='warning')
      return

    self.logger.clear_logs()
    self.logger.log("-----------------------------------------")
    self.logger.log(f"--- Starting Release operation for '{os.path.basename(datapack_path)}' ---", log_type='info')
    self.logger.log("-----------------------------------------")

    found_folders = self._perform_folder_cloning(datapack_path)

    if not found_folders:
      self.logger.log("No target folders were found in the selected datapack. Continuing to zip...", log_type='warning')
    
    # --- Zipping the datapack folder ---
    try:
      datapack_folder_name = os.path.basename(datapack_path)
      zip_base_name = os.path.join(self.release_output_path_var.get(), datapack_folder_name)
      
      self.logger.log(f"Creating release archive for '{datapack_folder_name}'...", log_type='info')
      
      # shutil.make_archive(base_name, format, root_dir)
      shutil.make_archive(zip_base_name, 'zip', datapack_path)
      
      self.logger.log(f"Successfully created: '{zip_base_name}.zip'", log_type='success')

    except Exception as e:
      self.logger.log(f"Error during zipping: {e}", log_type='error')
      
    self.logger.log("--- Release Tool operation complete ---", log_type='success')

  def trim_single_datapack(self, datapack_path):
    """
    Remove cloned folders (those with 's' suffix) from a datapack to undo the cloning operation.
    """
    if not messagebox.askyesno(
      "Confirmation",
      f"Are you sure you want to trim '{os.path.basename(datapack_path)}'? This will remove cloned folders (functions, advancements, etc.)."
    ):
      self.logger.log("Trim operation cancelled by user.", log_type='warning')
      return

    self.logger.clear_logs()
    self.logger.log("-----------------------------------------")
    self.logger.log(f"--- Starting Trim operation for '{os.path.basename(datapack_path)}' ---", log_type='info')
    self.logger.log("-----------------------------------------")

    found_folders = self._perform_folder_trimming(datapack_path)

    if not found_folders:
      self.logger.log("No cloned folders were found in the selected datapack.", log_type='warning')
    else:
      self.logger.log("Trim operation completed successfully.", log_type='success')
      
    self.logger.log("--- Trim operation complete ---", log_type='success')
    
    # Refresh the display to update button states
    self.display_filtered_datapacks()

  def _has_cloned_folders(self, datapack_path):
    """
    Check if a datapack has any cloned folders (folders with 's' suffix).
    Returns True if cloned folders exist, False otherwise.
    """
    # Create list of cloned folder names (original + 's')
    cloned_folders = [folder + 's' for folder in self.folders_to_clone]
    
    for dirpath, dirnames, _ in os.walk(datapack_path):
      # Only consider folders that are direct children of a `data` directory
      relative_path_parts = Path(dirpath).parts
      if 'data' in relative_path_parts and len(relative_path_parts) > relative_path_parts.index('data') + 1:
        
        for folder_name in dirnames:
          if folder_name in cloned_folders:
            return True
    
    return False

  def _perform_folder_cloning(self, datapack_path):
    """
    Perform the actual folder cloning operation.
    Returns True if any folders were processed, False otherwise.
    """
    found_folders = False
    for dirpath, dirnames, _ in os.walk(datapack_path):
      # Only consider folders that are direct children of a `data` directory
      relative_path_parts = Path(dirpath).parts
      if 'data' in relative_path_parts and len(relative_path_parts) > relative_path_parts.index('data') + 1:
        
        for folder_name in dirnames[:]:
          if folder_name in self.folders_to_clone:
            found_folders = True
            original_path = os.path.join(dirpath, folder_name)
            new_path = os.path.join(dirpath, folder_name + 's')
            
            self.logger.log(f"Processing folder: '{original_path}'", log_type='info')

            if os.path.exists(new_path):
              self.logger.log(f"   -> Found existing folder: '{new_path}'", log_type='warning')
              self.logger.log(f"   -> Deleting it...", log_type='warning')
              try:
                shutil.rmtree(new_path)
                self.logger.log("   -> Deletion successful.", log_type='success')
              except OSError as e:
                self.logger.log(f"   -> Error: Could not delete '{new_path}' - {e}", log_type='error')
                continue

            self.logger.log(f"   -> Cloning to '{new_path}'...", log_type='info')
            try:
              shutil.copytree(original_path, new_path)
              self.logger.log("   -> Done.", log_type='success')
            except shutil.Error as e:
              self.logger.log(f"   -> Error: {e}", log_type='error')
            
            self.logger.log("-----------------------------------------")
    
    return found_folders

  def _perform_folder_trimming(self, datapack_path):
    """
    Perform the actual folder trimming operation.
    Returns True if any folders were processed, False otherwise.
    """
    # Create list of cloned folder names (original + 's')
    cloned_folders = [folder + 's' for folder in self.folders_to_clone]
    
    found_folders = False
    for dirpath, dirnames, _ in os.walk(datapack_path):
      # Only consider folders that are direct children of a `data` directory
      relative_path_parts = Path(dirpath).parts
      if 'data' in relative_path_parts and len(relative_path_parts) > relative_path_parts.index('data') + 1:
        
        for folder_name in dirnames[:]:
          if folder_name in cloned_folders:
            found_folders = True
            folder_path = os.path.join(dirpath, folder_name)
            
            self.logger.log(f"Removing cloned folder: '{folder_path}'", log_type='info')
            
            try:
              shutil.rmtree(folder_path)
              self.logger.log(f"   -> Successfully removed '{folder_name}'", log_type='success')
            except OSError as e:
              self.logger.log(f"   -> Error: Could not remove '{folder_path}' - {e}", log_type='error')
            
            self.logger.log("-----------------------------------------")
    
    return found_folders

  def clone_single_datapack(self, datapack_path):
    """
    Clone folders (create 's' suffix versions) in a datapack.
    """
    if not messagebox.askyesno(
      "Confirmation",
      f"Are you sure you want to clone folders in '{os.path.basename(datapack_path)}'? This will create cloned folders (functions, advancements, etc.)."
    ):
      self.logger.log("Clone operation cancelled by user.", log_type='warning')
      return

    self.logger.clear_logs()
    self.logger.log("-----------------------------------------")
    self.logger.log(f"--- Starting Clone operation for '{os.path.basename(datapack_path)}' ---", log_type='info')
    self.logger.log("-----------------------------------------")

    found_folders = self._perform_folder_cloning(datapack_path)

    if not found_folders:
      self.logger.log("No target folders were found in the selected datapack.", log_type='warning')
    else:
      self.logger.log("Clone operation completed successfully.", log_type='success')
      
    self.logger.log("--- Clone operation complete ---", log_type='success')
    
    # Refresh the display to update button states
    self.display_filtered_datapacks()

class ProjectCreatorFrame(ttk.Frame):
  """
  A frame for bootstrapping new datapack projects by cloning a starter
  pack and replacing specific strings in file and folder names and contents.
  """
  def __init__(self, parent, config, logger):
    super().__init__(parent)
    self.config = config
    self.logger = logger
    self.source_path_var = tk.StringVar()
    self.dest_path_var = tk.StringVar()
    self.new_name_var = tk.StringVar()
    self.new_tag_var = tk.StringVar()
    self.version_major_var = tk.StringVar()
    self.version_minor_var = tk.StringVar()
    self.version_patch_var = tk.StringVar()
    self.new_description_var = tk.StringVar()
    
    self.create_widgets()
    self.load_path_from_settings()

  def create_widgets(self):
    """Sets up the GUI layout with labels, entry fields, and buttons."""
    # Main frame for padding
    main_frame = ttk.Frame(self)
    main_frame.pack(expand=True, fill='both', padx=20, pady=20)

    # Use a grid layout for better alignment
    main_frame.grid_columnconfigure(1, weight=1)

    # Title
    title_label = ttk.Label(main_frame, text="Datapack Project Creator", font=('Arial', 14, 'bold'))
    title_label.grid(row=0, column=0, columnspan=3, pady=(0, 20))

    # Source Folder
    ttk.Label(main_frame, text="Starter Pack Folder:").grid(row=1, column=0, sticky='w', pady=5)
    source_entry = ttk.Entry(main_frame, textvariable=self.source_path_var, width=50)
    source_entry.grid(row=1, column=1, sticky='we', padx=5)
    ttk.Button(main_frame, text="Browse", command=self.browse_source_folder).grid(row=1, column=2, padx=5)

    # Destination Folder
    ttk.Label(main_frame, text="New Project Folder:").grid(row=2, column=0, sticky='w', pady=5)
    dest_entry = ttk.Entry(main_frame, textvariable=self.dest_path_var, width=50)
    dest_entry.grid(row=2, column=1, sticky='we', padx=5)
    ttk.Button(main_frame, text="Browse", command=self.browse_dest_folder).grid(row=2, column=2, padx=5)

    # New Datapack Name
    ttk.Label(main_frame, text="New Datapack Name:").grid(row=3, column=0, sticky='w', pady=5)
    name_entry = ttk.Entry(main_frame, textvariable=self.new_name_var, width=50)
    name_entry.grid(row=3, column=1, sticky='we', padx=5)

    # New Tag (e.g., 'MP')
    ttk.Label(main_frame, text="New Datapack Tag:").grid(row=4, column=0, sticky='w', pady=5)
    tag_entry = ttk.Entry(main_frame, textvariable=self.new_tag_var, width=50)
    tag_entry.grid(row=4, column=1, sticky='we', padx=5)

    # New Description
    ttk.Label(main_frame, text="New Description:").grid(row=5, column=0, sticky='w', pady=5)
    desc_entry = ttk.Entry(main_frame, textvariable=self.new_description_var, width=50)
    desc_entry.grid(row=5, column=1, sticky='we', padx=5)

    # Version fields
    ttk.Label(main_frame, text="Version:").grid(row=6, column=0, sticky='w', pady=5)
    
    # Create a frame to hold the version inputs in a row
    version_frame = ttk.Frame(main_frame)
    version_frame.grid(row=6, column=1, sticky='we', padx=5)
    
    # Version components
    ttk.Label(version_frame, text="v").pack(side='left')
    major_entry = ttk.Entry(version_frame, textvariable=self.version_major_var, width=3)
    major_entry.pack(side='left', padx=(2, 0))
    ttk.Label(version_frame, text=".").pack(side='left')
    minor_entry = ttk.Entry(version_frame, textvariable=self.version_minor_var, width=3)
    minor_entry.pack(side='left')
    ttk.Label(version_frame, text=".").pack(side='left')
    patch_entry = ttk.Entry(version_frame, textvariable=self.version_patch_var, width=3)
    patch_entry.pack(side='left')

    # Instructions
    instructions = (
      "Instructions:\n"
      "1. Select a starter pack folder (template datapack)\n"
      "2. Choose destination folder where new project will be created\n"
      "3. Enter the new datapack name (e.g., 'My New Datapack')\n"
      "4. Enter the new datapack tag (e.g., 'MN' - must be exactly 2 letters)\n"
      "5. Enter the new description (e.g., 'A custom datapack for...')\n"
      "6. Enter the version numbers (e.g., v1.00.00)\n"
      "   - Major: single digit (1-9)\n"
      "   - Minor: double digit (00-99)\n"
      "   - Patch: double digit (00-99)\n\n"
      "The tool will replace 'My Datapack', 'MyDatapack', 'mydatapack', 'MD', etc.\n"
      "with your new values throughout all files and folder names.\n"
      "Output folder will be named: newdatapackname-version\n\n"
      "Note: Datapack tag must be exactly 2 letters to follow project conventions."
    )
    
    instructions_label = ttk.Label(main_frame, text=instructions, justify='left', 
                                  font=(None, 10), foreground='#666666')
    instructions_label.grid(row=7, column=0, columnspan=3, sticky='w', pady=(10, 0))

    # Action Button
    bootstrap_button = ttk.Button(main_frame, text="Clone and Bootstrap", 
                                 command=self.run_bootstrapper, style='Custom.TButton')
    bootstrap_button.grid(row=8, column=0, columnspan=3, pady=20, sticky='we')

  def browse_source_folder(self):
    """Opens a dialog to select the source folder."""
    initial_dir = self.source_path_var.get() if self.source_path_var.get() else self.get_standards_path()
    folder = filedialog.askdirectory(initialdir=initial_dir)
    if folder:
      self.source_path_var.set(folder)
      self.save_path_to_settings()

  def browse_dest_folder(self):
    """Opens a dialog to select the destination folder."""
    initial_dir = self.dest_path_var.get() if self.dest_path_var.get() else self.get_work_in_progress_path()
    folder = filedialog.askdirectory(initialdir=initial_dir)
    if folder:
      self.dest_path_var.set(folder)
      self.save_path_to_settings()

  def get_standards_path(self):
    """Get the _standards path as default source."""
    try:
      script_dir = Path(__file__).resolve().parent.parent
      standards_path = script_dir / "_standards"
      if standards_path.exists():
        return str(standards_path)
    except:
      pass
    return ""

  def get_work_in_progress_path(self):
    """Get the '4. work in progress' path as default destination."""
    try:
      script_dir = Path(__file__).resolve().parent.parent
      wip_path = script_dir / "4. work in progress"
      if wip_path.exists():
        return str(wip_path)
    except:
      pass
    return ""

  def save_path_to_settings(self):
    """Save bootstrapper paths and fields to settings."""
    if "Settings" not in self.config:
      self.config.add_section("Settings")
    self.config.set("Settings", "bootstrapper_source_path", self.source_path_var.get())
    self.config.set("Settings", "bootstrapper_dest_path", self.dest_path_var.get())
    self.config.set("Settings", "bootstrapper_name", self.new_name_var.get())
    self.config.set("Settings", "bootstrapper_tag", self.new_tag_var.get())
    self.config.set("Settings", "bootstrapper_description", self.new_description_var.get())
    self.config.set("Settings", "bootstrapper_version_major", self.version_major_var.get())
    self.config.set("Settings", "bootstrapper_version_minor", self.version_minor_var.get())
    self.config.set("Settings", "bootstrapper_version_patch", self.version_patch_var.get())
    
    settings_folder = self.config.get("Settings", "save_path", fallback=str(Path(__file__).resolve().parent))
    settings_file = Path(settings_folder) / "dmtool_settings.ini"
    try:
      with open(settings_file, "w") as config_file:
        self.config.write(config_file)
    except Exception as e:
      self.logger.log(f"Error saving bootstrapper paths: {e}", log_type='error')

  def load_path_from_settings(self):
    """Load bootstrapper paths and fields from settings."""
    source_path = self.config.get("Settings", "bootstrapper_source_path", fallback=self.get_standards_path())
    dest_path = self.config.get("Settings", "bootstrapper_dest_path", fallback=self.get_work_in_progress_path())
    
    if source_path and os.path.isdir(source_path):
      self.source_path_var.set(source_path)
    if dest_path and os.path.isdir(dest_path):
      self.dest_path_var.set(dest_path)
    
    # Load other fields
    self.new_name_var.set(self.config.get("Settings", "bootstrapper_name", fallback=""))
    self.new_tag_var.set(self.config.get("Settings", "bootstrapper_tag", fallback=""))
    self.new_description_var.set(self.config.get("Settings", "bootstrapper_description", fallback=""))
    self.version_major_var.set(self.config.get("Settings", "bootstrapper_version_major", fallback="1"))
    self.version_minor_var.set(self.config.get("Settings", "bootstrapper_version_minor", fallback="00"))
    self.version_patch_var.set(self.config.get("Settings", "bootstrapper_version_patch", fallback="00"))

  def run_bootstrapper(self):
    """Main function to orchestrate the cloning and renaming process."""
    source = self.source_path_var.get()
    dest = self.dest_path_var.get()
    new_name = self.new_name_var.get()
    new_tag = self.new_tag_var.get()
    new_description = self.new_description_var.get()
    version_major = self.version_major_var.get()
    version_minor = self.version_minor_var.get()
    version_patch = self.version_patch_var.get()

    # Input validation
    if not all([source, dest, new_name, new_tag, new_description, version_major, version_minor, version_patch]):
      self.logger.log("Error: All fields must be filled out.", log_type='error')
      return
    if not os.path.isdir(source):
      self.logger.log("Error: Source folder does not exist.", log_type='error')
      return
    if not os.path.isdir(dest):
      self.logger.log("Error: Destination folder does not exist.", log_type='error')
      return
    
    # Validate tag is exactly 2 letters
    new_tag_clean = new_tag.replace(" ", "")
    if len(new_tag_clean) != 2 or not new_tag_clean.isalpha():
      self.logger.log("Error: Datapack tag must be exactly 2 letters (A-Z).", log_type='error')
      return
    
    # Validate version components
    try:
      major = int(version_major)
      minor = int(version_minor)
      patch = int(version_patch)
      
      if not (1 <= major <= 9):
        self.logger.log("Error: Major version must be a single digit (1-9).", log_type='error')
        return
      if not (0 <= minor <= 99):
        self.logger.log("Error: Minor version must be between 00-99.", log_type='error')
        return
      if not (0 <= patch <= 99):
        self.logger.log("Error: Patch version must be between 00-99.", log_type='error')
        return
    except ValueError:
      self.logger.log("Error: Version components must be numbers.", log_type='error')
      return
    
    # Format version with leading zeros for minor and patch
    version = f"v{major}.{minor:02d}.{patch:02d}"
    
    # Create numeric version for scoreboard (remove v and dots)
    version_numeric = f"{major}{minor:02d}{patch:02d}"

    self.logger.clear_logs()
    self.logger.log("-" * 50)
    self.logger.log("--- Starting Bootstrapper operation ---", log_type='info')
    self.logger.log("-" * 50)
    self.logger.log(f"Source: {source}")
    self.logger.log(f"Destination: {dest}")
    self.logger.log(f"New Name: {new_name}")
    self.logger.log(f"New Tag: {new_tag}")
    self.logger.log(f"New Description: {new_description}")
    self.logger.log(f"Version: {version}")
    
    # Save current values to settings
    self.save_path_to_settings()

    # Define the strings to be replaced based on user input
    new_name_no_space = new_name.replace(" ", "")
    new_tag_no_space = new_tag.replace(" ", "")
    
    # Create new project folder name: newname-version (lowercase, no spaces)
    new_folder_name = f"{new_name_no_space.lower()}-{version}"
    
    replacements = {
      "My Datapack": new_name,
      "MyDatapack": new_name_no_space,
      "mydatapack": new_name_no_space.lower(),
      "MD": new_tag_no_space,
      "z_md_": f"z_{new_tag_no_space.lower()}_",
      "MD_": f"{new_tag_no_space}_",
      "md_": f"{new_tag_no_space.lower()}_",
      # Description replacement
      "A template made by touchportyl!": new_description,
      # Version replacements
      "v1.00.00": version,
      # Specific replacement for scoreboard version in preinstaller/check.mcfunction
      # Replace the entire original line with the updated line
      f"scoreboard players set VERSION$datapack.current {new_name_no_space} 10000": f"scoreboard players set VERSION$datapack.current {new_name_no_space} {version_numeric}"
    }

    try:
      # Clone the entire directory structure with new name
      new_project_path = os.path.join(dest, new_folder_name)
      self.logger.log(f"Copying directory structure to: {new_project_path}")
      
      # Create the destination directory
      os.makedirs(new_project_path, exist_ok=False)
      
      # Copy contents of source directory to new project path
      for item in os.listdir(source):
        source_item = os.path.join(source, item)
        dest_item = os.path.join(new_project_path, item)
        if os.path.isdir(source_item):
          shutil.copytree(source_item, dest_item)
        else:
          shutil.copy2(source_item, dest_item)

      # Walk the new project directory from the bottom up to rename files/folders
      self.logger.log("Processing files and folders...")
      files_processed = 0
      folders_renamed = 0
      
      for dirpath, dirnames, filenames in os.walk(new_project_path, topdown=False):
        # Process files
        for filename in filenames:
          old_filepath = os.path.join(dirpath, filename)
          new_filename = filename
          
          # Replace strings in file content
          try:
            with open(old_filepath, 'r', encoding='utf-8') as f:
              content = f.read()
            
            modified_content = content
            content_changed = False
            for old_str, new_str in replacements.items():
              if old_str in modified_content:
                modified_content = modified_content.replace(old_str, new_str)
                content_changed = True

            if content_changed:
              with open(old_filepath, 'w', encoding='utf-8') as f:
                f.write(modified_content)
              
          except UnicodeDecodeError:
            # Handle binary files by skipping content replacement
            pass
          
          # Replace strings in filename
          for old_str, new_str in replacements.items():
            new_filename = new_filename.replace(old_str, new_str)

          if new_filename != filename:
            new_filepath = os.path.join(dirpath, new_filename)
            os.rename(old_filepath, new_filepath)
            
          files_processed += 1

        # Process directories
        for dirname in dirnames:
          old_dirpath = os.path.join(dirpath, dirname)
          new_dirname = dirname
          
          # Replace strings in directory name
          for old_str, new_str in replacements.items():
            new_dirname = new_dirname.replace(old_str, new_str)
          
          if new_dirname != dirname:
            new_dirpath = os.path.join(dirpath, new_dirname)
            os.rename(old_dirpath, new_dirpath)
            folders_renamed += 1

      self.logger.log(f"Processed {files_processed} files")
      self.logger.log(f"Renamed {folders_renamed} folders")
      self.logger.log(f"Project successfully created at: {new_project_path}", log_type='success')
      self.logger.log("--- Bootstrapper operation complete ---", log_type='success')
    
    except FileExistsError as e:
      error_msg = f"A folder named '{new_folder_name}' already exists in the destination. Please delete it or choose a different destination."
      self.logger.log(f"Error: {error_msg}", log_type='error')
    except Exception as e:
      self.logger.log(f"An unexpected error occurred: {e}", log_type='error')

class FrameworkUpdaterFrame(ttk.Frame):
  def __init__(self, parent, config, logger):
    super().__init__(parent)
    self.config = config
    self.logger = logger
    self.template_path_var = tk.StringVar()
    self.target_path_var = tk.StringVar()
    
    # Store framework folders to copy (much more efficient than individual files)
    self.framework_folders = [
      'data/datapackmanager-1.21',
      'data/datapackmanager', 
      'data/minecraft'
    ]
    
    self.setup_ui()
    self.load_paths_from_settings()
    
  def load_paths_from_settings(self):
    """Load template and target paths from settings"""
    try:
      if self.config.has_option('UpdaterFrame', 'template_path'):
        template_path = self.config.get('UpdaterFrame', 'template_path')
        if template_path and Path(template_path).exists():
          self.template_path_var.set(template_path)
          
      if self.config.has_option('UpdaterFrame', 'target_path'):
        target_path = self.config.get('UpdaterFrame', 'target_path')
        if target_path and Path(target_path).exists():
          self.target_path_var.set(target_path)
    except Exception as e:
      self.logger.log(f"Error loading updater paths from settings: {e}", log_type='error')
      
  def save_paths_to_settings(self):
    """Save template and target paths to settings"""
    try:
      if not self.config.has_section('UpdaterFrame'):
        self.config.add_section('UpdaterFrame')
        
      self.config.set('UpdaterFrame', 'template_path', self.template_path_var.get())
      self.config.set('UpdaterFrame', 'target_path', self.target_path_var.get())
      
      # Save the config file
      settings_file = Path(__file__).parent / 'dmtool_settings.ini'
      with open(settings_file, 'w') as f:
        self.config.write(f)
        
      self.logger.log("Updater paths saved to settings")
    except Exception as e:
      self.logger.log(f"Error saving updater paths to settings: {e}", log_type='error')
      
  def compare_files(self, template_file, target_file):
    """Compare two files and return diff information"""
    try:
      # First check if files exist and have different sizes/modification times
      if not template_file.exists():
        return {'status': 'missing_template', 'details': 'Template file does not exist'}
      if not target_file.exists():
        return {'status': 'missing_target', 'details': 'Target file does not exist'}
        
      # Quick check with file hashes for binary equivalence
      def get_file_hash(filepath):
        hash_md5 = hashlib.md5()
        with open(filepath, "rb") as f:
          for chunk in iter(lambda: f.read(4096), b""):
            hash_md5.update(chunk)
        return hash_md5.hexdigest()
        
      template_hash = get_file_hash(template_file)
      target_hash = get_file_hash(target_file)
      
      if template_hash == target_hash:
        return {'status': 'identical', 'details': 'Files are identical'}
        
      # Files are different, check if they're text files for diff
      try:
        with open(template_file, 'r', encoding='utf-8') as f:
          template_lines = f.readlines()
        with open(target_file, 'r', encoding='utf-8') as f:
          target_lines = f.readlines()
          
        # Generate a simple diff summary
        diff = list(difflib.unified_diff(
          target_lines, template_lines,
          fromfile=f'target/{target_file.name}',
          tofile=f'template/{template_file.name}',
          lineterm='', n=3
        ))
        
        if diff:
          # Count changes
          additions = sum(1 for line in diff if line.startswith('+') and not line.startswith('+++'))
          deletions = sum(1 for line in diff if line.startswith('-') and not line.startswith('---'))
          return {
            'status': 'different',
            'details': f'+{additions} -{deletions} lines',
            'diff_lines': len(diff)
          }
        else:
          return {'status': 'identical', 'details': 'Files are identical'}
          
      except UnicodeDecodeError:
        # Binary file, just report as different
        template_size = template_file.stat().st_size
        target_size = target_file.stat().st_size
        return {
          'status': 'different_binary',
          'details': f'Binary files differ (template: {template_size}B, target: {target_size}B)'
        }
        
    except Exception as e:
      return {'status': 'error', 'details': f'Error comparing files: {e}'}
      
  def analyze_folder_differences(self, template_folder, target_folder):
    """Analyze differences between template and target folders"""
    differences = {
      'identical': 0,
      'different': 0,
      'missing_in_target': 0,
      'different_files': [],
      'missing_files': []
    }
    
    try:
      # Get all files in template folder
      template_files = {f.relative_to(template_folder): f for f in template_folder.rglob('*') if f.is_file()}
      target_files = {f.relative_to(target_folder): f for f in target_folder.rglob('*') if f.is_file()}
      
      # Compare files that exist in template
      for rel_path, template_file in template_files.items():
        if rel_path in target_files:
          target_file = target_files[rel_path]
          comparison = self.compare_files(template_file, target_file)
          
          if comparison['status'] == 'identical':
            differences['identical'] += 1
          else:
            differences['different'] += 1
            differences['different_files'].append({
              'path': str(rel_path),
              'comparison': comparison
            })
        else:
          differences['missing_in_target'] += 1
          differences['missing_files'].append(str(rel_path))
          
    except Exception as e:
      self.logger.log(f"Error analyzing folder differences: {e}", log_type='error')
      
    return differences
    
  def setup_ui(self):
    """Setup the user interface for the updater tab"""
    
    # Title and description
    title_frame = ttk.Frame(self)
    title_frame.pack(fill="x", padx=10, pady=5)
    
    title_label = ttk.Label(title_frame, text="Datapack Framework Updater", 
                          font=('Arial', 14, 'bold'))
    title_label.pack(anchor="w")
    
    desc_label = ttk.Label(title_frame, 
                         text="Update framework files while preserving user content. Select a template and target datapack.",
                         font=('Arial', 10))
    desc_label.pack(anchor="w", pady=(0, 10))
    
    # Template selection frame
    template_frame = ttk.Frame(self)
    template_frame.pack(fill="x", padx=10, pady=5)
    
    ttk.Label(template_frame, text="Template Source:", font=('Arial', 10, 'bold')).pack(anchor="w")
    
    template_path_frame = ttk.Frame(template_frame)
    template_path_frame.pack(fill="x", pady=(5, 0))
    
    self.template_entry = ttk.Entry(template_path_frame, textvariable=self.template_path_var, 
                                  font=('Arial', 10), state='readonly')
    self.template_entry.pack(side="left", fill="x", expand=True)
    
    self.browse_template_button = ttk.Button(template_path_frame, text="Browse Template", 
                                           command=self.browse_template)
    self.browse_template_button.pack(side="left", padx=(5, 0))
    
    # Target selection frame
    target_frame = ttk.Frame(self)
    target_frame.pack(fill="x", padx=10, pady=5)
    
    ttk.Label(target_frame, text="Target Datapack:", font=('Arial', 10, 'bold')).pack(anchor="w")
    
    target_path_frame = ttk.Frame(target_frame)
    target_path_frame.pack(fill="x", pady=(5, 0))
    
    self.target_entry = ttk.Entry(target_path_frame, textvariable=self.target_path_var, 
                                font=('Arial', 10))
    self.target_entry.pack(side="left", fill="x", expand=True)
    
    self.browse_target_button = ttk.Button(target_path_frame, text="Browse Target", 
                                         command=self.browse_target)
    self.browse_target_button.pack(side="left", padx=(5, 0))
    
    # Status and preview frame
    status_frame = ttk.Frame(self)
    status_frame.pack(fill="both", expand=True, padx=10, pady=10)
    
    ttk.Label(status_frame, text="Update Preview:", font=('Arial', 10, 'bold')).pack(anchor="w")
    
    # Text area for showing what will be updated
    preview_frame = ttk.Frame(status_frame)
    preview_frame.pack(fill="both", expand=True, pady=(5, 0))
    
    self.preview_text = scrolledtext.ScrolledText(preview_frame, height=15, 
                                                 font=('Consolas', 9))
    self.preview_text.pack(fill="both", expand=True)
    
    # Action buttons
    button_frame = ttk.Frame(self)
    button_frame.pack(fill="x", padx=10, pady=5)
    
    self.preview_button = ttk.Button(button_frame, text="Preview Update", 
                                   command=self.preview_update)
    self.preview_button.pack(side="left", padx=(0, 5))
    
    self.update_button = ttk.Button(button_frame, text="Apply Update", 
                                  command=self.apply_update)
    self.update_button.pack(side="left", padx=(0, 5))
    
    # Initially disable update button
    self.update_button.config(state='disabled')
    
    # Add validation to enable/disable buttons
    self.template_path_var.trace_add('write', self.validate_inputs)
    self.target_path_var.trace_add('write', self.validate_inputs)
    
  def browse_template(self):
    """Browse for template directory"""
    # Use the app's root directory as initial directory
    initial_dir = self.config.get("Settings", "root_directory", fallback=str(Path(__file__).resolve().parent))
    if not os.path.isdir(initial_dir):
      initial_dir = str(Path(__file__).resolve().parent)
    
    directory = filedialog.askdirectory(initialdir=initial_dir, title="Select Template Datapack Directory")
    if directory:
      self.template_path_var.set(directory)
      self.logger.log(f"Template selected: {directory}")
      self.save_paths_to_settings()
      
  def browse_target(self):
    """Browse for target directory"""
    # Use the app's root directory as initial directory
    initial_dir = self.config.get("Settings", "root_directory", fallback=str(Path(__file__).resolve().parent))
    if not os.path.isdir(initial_dir):
      initial_dir = str(Path(__file__).resolve().parent)
    
    directory = filedialog.askdirectory(initialdir=initial_dir, title="Select Target Datapack Directory")
    if directory:
      self.target_path_var.set(directory)
      self.logger.log(f"Target selected: {directory}")
      self.save_paths_to_settings()
      
  def validate_inputs(self, var_name=None, index=None, mode=None):
    """Validate inputs and enable/disable buttons (compatible with trace_add)"""
    template_valid = bool(self.template_path_var.get() and 
                         Path(self.template_path_var.get()).exists())
    target_valid = bool(self.target_path_var.get() and 
                       Path(self.target_path_var.get()).exists())
                       
    # Enable preview button if both paths are valid
    self.preview_button.config(state='normal' if (template_valid and target_valid) else 'disabled')
    
    # Update button is enabled only after a successful preview
    # (This will be set in preview_update method)
    
  def preview_update(self):
    """Preview what files will be updated"""
    try:
      template_path = Path(self.template_path_var.get())
      target_path = Path(self.target_path_var.get())
      
      if not template_path.exists():
        self.logger.log("Template path does not exist", log_type='error')
        return
        
      if not target_path.exists():
        self.logger.log("Target path does not exist", log_type='error')
        return
        
      # Clear preview
      self.preview_text.delete('1.0', tk.END)
      
      self.logger.log("Generating update preview...")
      
      # Check which framework folders exist in both template and target
      folders_to_update = []
      folders_missing_in_template = []
      folders_missing_in_target = []
      
      for rel_path in self.framework_folders:
        # Convert forward slashes to proper path separators
        rel_path_obj = Path(rel_path.replace('/', os.sep))
        
        template_folder = template_path / rel_path_obj
        target_folder = target_path / rel_path_obj
        
        if template_folder.exists() and target_folder.exists():
          folders_to_update.append((rel_path, template_folder, target_folder))
        elif template_folder.exists() and not target_folder.exists():
          folders_missing_in_target.append((rel_path, template_folder, target_folder))
        elif not template_folder.exists():
          folders_missing_in_template.append(rel_path)
          
      # Display preview
      self.preview_text.insert(tk.END, f"UPDATE PREVIEW\n")
      self.preview_text.insert(tk.END, f"Template: {template_path.name}\n")
      self.preview_text.insert(tk.END, f"Target: {target_path.name}\n\n")
      
      self.preview_text.insert(tk.END, f"Framework folders to update ({len(folders_to_update)}):\n")
      self.preview_text.insert(tk.END, "=" * 50 + "\n")
      
      # Analyze differences for each folder
      total_different_files = 0
      total_identical_files = 0
      total_missing_files = 0
      
      for rel_path, template_folder, target_folder in folders_to_update:
        self.preview_text.insert(tk.END, f"\n{rel_path}:\n")
        
        # Analyze folder differences
        differences = self.analyze_folder_differences(template_folder, target_folder)
        
        total_different_files += differences['different']
        total_identical_files += differences['identical']
        total_missing_files += differences['missing_in_target']
        
        # Display summary
        if differences['different'] > 0:
          self.preview_text.insert(tk.END, f"  ⚠️  {differences['different']} files to update\n")
        if differences['missing_in_target'] > 0:
          self.preview_text.insert(tk.END, f"  ➕ {differences['missing_in_target']} files to add\n")
        if differences['identical'] > 0:
          self.preview_text.insert(tk.END, f"  ✅ {differences['identical']} files already up-to-date\n")
          
        # Show details for different files (limit to avoid overwhelming output)
        if differences['different_files']:
          shown_files = differences['different_files'][:5]  # Show max 5 files
          for file_info in shown_files:
            status_symbol = "🔄" if file_info['comparison']['status'] == 'different' else "⚠️"
            self.preview_text.insert(tk.END, f"    {status_symbol} {file_info['path']} - {file_info['comparison']['details']}\n")
          
          if len(differences['different_files']) > 5:
            remaining = len(differences['different_files']) - 5
            self.preview_text.insert(tk.END, f"    ... and {remaining} more files\n")
            
        # Show missing files (limit to avoid overwhelming output)
        if differences['missing_files']:
          shown_missing = differences['missing_files'][:3]  # Show max 3 files
          for missing_file in shown_missing:
            self.preview_text.insert(tk.END, f"    ➕ {missing_file} (new)\n")
          
          if len(differences['missing_files']) > 3:
            remaining = len(differences['missing_files']) - 3
            self.preview_text.insert(tk.END, f"    ... and {remaining} more new files\n")
      
      # Add summary
      if folders_to_update:
        self.preview_text.insert(tk.END, f"\nSUMMARY:\n")
        self.preview_text.insert(tk.END, f"Files to update: {total_different_files}\n")
        self.preview_text.insert(tk.END, f"Files to add: {total_missing_files}\n")
        self.preview_text.insert(tk.END, f"Files up-to-date: {total_identical_files}\n")
        
      if folders_missing_in_template:
        self.preview_text.insert(tk.END, f"\nFolders missing in template ({len(folders_missing_in_template)}):\n")
        for folder_path in folders_missing_in_template:
          self.preview_text.insert(tk.END, f"  Warning: {folder_path}\n")
          
      if folders_missing_in_target:
        self.preview_text.insert(tk.END, f"\nNew folders to add ({len(folders_missing_in_target)}):\n")
        for folder_path in folders_missing_in_target:
          self.preview_text.insert(tk.END, f"  New: {folder_path}\n")
          
      # Enable update button if there are folders to update
      if folders_to_update or folders_missing_in_target:
        self.update_button.config(state='normal')
        self.preview_text.insert(tk.END, f"\nStatus: Ready to apply framework update\n")
      else:
        self.update_button.config(state='disabled')
        self.preview_text.insert(tk.END, f"\nStatus: No framework folders require updating\n")
        
      self.logger.log(f"Preview analysis completed: {len(folders_to_update)} framework folders identified for update", log_type='info')
      
    except Exception as e:
      self.logger.log(f"Error generating preview: {e}", log_type='error')
      self.update_button.config(state='disabled')
      
  def apply_update(self):
    """Apply the framework update"""
    try:
      template_path = Path(self.template_path_var.get())
      target_path = Path(self.target_path_var.get())
      
      # Confirm with user
      result = messagebox.askyesno(
        "Confirm Framework Update", 
        f"This will update framework folders in:\n{target_path.name}\n\n" +
        f"• data/datapackmanager-1.21/\n" +
        f"• data/datapackmanager/\n" +
        f"• data/minecraft/\n\n" +
        f"User content will be preserved.\n\nContinue?"
      )
      
      if not result:
        self.logger.log("Framework update operation cancelled by user", log_type='info')
        return
        
      self.logger.log("Initiating framework update operation", log_type='info')
      
      # Start update in background thread
      update_thread = Thread(target=self._perform_update, 
                           args=(template_path, target_path))
      update_thread.start()
      
    except Exception as e:
      self.logger.log(f"Error starting update: {e}", log_type='error')
      
  def _convert_namespace_in_folder(self, updated_folder, target_datapack_path):
    """Convert 'mydatapack' namespace references to the correct datapack namespace"""
    try:
      # Extract datapack name from target path
      datapack_name = target_datapack_path.name
      
      # Remove version suffix to get clean namespace (e.g., "portyltrident-v1.00.05" -> "portyltrident")
      if '-v' in datapack_name:
        namespace = datapack_name.split('-v')[0]
      elif ' copy' in datapack_name:
        # Handle " copy" suffix and version
        clean_name = datapack_name.replace(' copy', '')
        if '-v' in clean_name:
          namespace = clean_name.split('-v')[0]
        else:
          namespace = clean_name
      else:
        namespace = datapack_name
      
      # Find JSON files that might contain namespace references
      json_files = list(updated_folder.rglob('*.json'))
      
      for json_file in json_files:
        try:
          # Read file content
          with open(json_file, 'r', encoding='utf-8') as f:
            content = f.read()
          
          # Check if file contains 'mydatapack' namespace
          if 'mydatapack:' in content:
            # Replace mydatapack namespace with correct namespace
            updated_content = content.replace('mydatapack:', f'{namespace}:')
            
            # Write back the updated content
            with open(json_file, 'w', encoding='utf-8') as f:
              f.write(updated_content)
            
            # Log the conversion
            relative_path = json_file.relative_to(target_datapack_path)
            self.logger.log(f"Namespace converted in {relative_path}: mydatapack -> {namespace}", log_type='info')
            
        except Exception as e:
          self.logger.log(f"Error converting namespace in {json_file}: {e}", log_type='error')
          
    except Exception as e:
      self.logger.log(f"Error during namespace conversion: {e}", log_type='error')
      
  def _perform_update(self, template_path, target_path):
    """Perform the actual update in a background thread using folder copying"""
    try:
      updated_folders = 0
      added_folders = 0
      total_files_processed = 0
      error_count = 0
      
      for rel_path in self.framework_folders:
        try:
          # Convert forward slashes to proper path separators
          rel_path_obj = Path(rel_path.replace('/', os.sep))
          
          template_folder = template_path / rel_path_obj
          target_folder = target_path / rel_path_obj
          
          if template_folder.exists():
            folder_existed = target_folder.exists()
            
            # Remove existing target folder if it exists
            if folder_existed:
              shutil.rmtree(target_folder)
              self.logger.log(f"Framework folder removed: {rel_path}", log_type='info')
            
            # Copy entire folder from template to target
            shutil.copytree(template_folder, target_folder)
            
            # Count files copied
            file_count = sum(1 for _ in target_folder.rglob('*') if _.is_file())
            total_files_processed += file_count
            
            if folder_existed:
              updated_folders += 1
              self.logger.log(f"Framework folder updated: {rel_path} - {file_count} files processed", log_type='success')
            else:
              added_folders += 1
              self.logger.log(f"Framework folder added: {rel_path} - {file_count} files processed", log_type='success')
            
            # Apply namespace conversion for specific files
            self._convert_namespace_in_folder(target_folder, target_path)
              
        except Exception as e:
          error_count += 1
          self.logger.log(f"Error updating folder {rel_path}: {e}", log_type='error')
          
      # Summary
      self.logger.log(
        "Framework update operation completed successfully", 
        log_type='success'
      )
      self.logger.log(
        f"Operation summary: {updated_folders} folders updated, {added_folders} folders added", 
        log_type='success'
      )
      self.logger.log(
        f"Total files processed: {total_files_processed}", 
        log_type='success'
      )
      
      if error_count > 0:
        self.logger.log(f"Warning: {error_count} folders encountered errors during processing. Review log output for details.", log_type='warning')
      else:
        self.logger.log("All framework folders have been successfully updated without errors", log_type='success')
        
      # Disable update button after completion
      self.update_button.config(state='disabled')
      
    except Exception as e:
      self.logger.log(f"Critical error during update: {e}", log_type='error')

if __name__ == "__main__":
  app = DatapackManagerApp()
  app.mainloop()