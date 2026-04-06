import os
import shutil
import tkinter as tk
from tkinter import filedialog, scrolledtext, messagebox
from datetime import datetime

class DatapackClonerApp:
  """
  A simple GUI application for cloning and overwriting Minecraft datapack folders.
  """
  def __init__(self, master):
    self.master = master
    master.title("Datapack Folder Cloner")
    master.geometry("600x450")

    # Define the folders to be cloned
    self.folders_to_clone = [
      'advancement', 'function', 'predicate', 'item_modifier', 'recipe', 'loot_table', 'tag'
    ]

    # --- GUI Layout ---

    # Frame for directory selection
    dir_frame = tk.Frame(master, padx=10, pady=5)
    dir_frame.pack(fill=tk.X)
    
    self.dir_label = tk.Label(dir_frame, text="Root Directory:")
    self.dir_label.pack(side=tk.LEFT, padx=(0, 5))
    
    self.dir_entry = tk.Entry(dir_frame, width=50)
    self.dir_entry.pack(side=tk.LEFT, fill=tk.X, expand=True)
    self.dir_entry.insert(0, r'C:\Users\admin\AppData\Roaming\.minecraft\saves\datapacks\datapacks') # Start from the new default directory
    
    self.browse_button = tk.Button(dir_frame, text="Browse", command=self.browse_directory)
    self.browse_button.pack(side=tk.LEFT, padx=(5, 0))

    # Frame for buttons
    button_frame = tk.Frame(master, padx=10, pady=5)
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

    # Scrolled text area for console output
    self.log_area = scrolledtext.ScrolledText(master, wrap=tk.WORD, state=tk.DISABLED, height=15)
    self.log_area.pack(fill=tk.BOTH, expand=True, padx=10, pady=5)

    # Configure tags for different log message types
    self.log_area.tag_config('info', foreground='blue')
    self.log_area.tag_config('success', foreground='green')
    self.log_area.tag_config('error', foreground='red')
    self.log_area.tag_config('warning', foreground='orange')

  def browse_directory(self):
    """Opens a file dialog to select the root directory."""
    initial_dir = self.dir_entry.get() if self.dir_entry.get() else os.getcwd()
    selected_dir = filedialog.askdirectory(initialdir=initial_dir)
    if selected_dir:
      self.dir_entry.delete(0, tk.END)
      self.dir_entry.insert(0, selected_dir)

  def log(self, message, log_type='info'):
    """Inserts a message into the log area with a timestamp and color."""
    timestamp = datetime.now().strftime("[%Y-%m-%d %H:%M:%S]")
    self.log_area.config(state=tk.NORMAL)
    self.log_area.insert(tk.END, f"{timestamp} {message}\n", log_type)
    self.log_area.see(tk.END)
    self.log_area.config(state=tk.DISABLED)
    self.master.update_idletasks() # Refresh the GUI

  def run_task(self, is_test_mode):
    """
    Executes the folder cloning logic based on the mode (test or real).
    """
    root_dir = self.dir_entry.get()
    
    self.log_area.config(state=tk.NORMAL)
    self.log_area.delete(1.0, tk.END)
    self.log_area.config(state=tk.DISABLED)

    if not os.path.isdir(root_dir):
      messagebox.showerror("Error", f"The directory '{root_dir}' does not exist.")
      self.log(f"Error: Directory not found - '{root_dir}'", log_type='error')
      return

    if not is_test_mode:
      if not messagebox.askyesno(
          "Confirmation",
          "Are you sure you want to overwrite and clone the folders? This action is permanent."
      ):
        self.log("Operation cancelled by user.")
        return

    self.log("-----------------------------------------")
    self.log("--- Starting operation ---", log_type='info')
    self.log(f"Mode: {'Test Run (No changes will be made)' if is_test_mode else 'Overwrite and Clone'}", log_type='info')
    self.log(f"Root Directory: {root_dir}", log_type='info')
    self.log(f"Target Folders: {', '.join(self.folders_to_clone)}", log_type='info')
    self.log("-----------------------------------------")

    found_folders = False
    for dirpath, dirnames, filenames in os.walk(root_dir):
      for folder_name in dirnames:
        if folder_name in self.folders_to_clone:
          found_folders = True
          original_path = os.path.join(dirpath, folder_name)
          new_path = os.path.join(dirpath, folder_name + 's')
          
          self.log(f"Processing folder: '{original_path}'", log_type='info')

          if os.path.exists(new_path):
            self.log(f"  -> Found existing folder: '{new_path}'", log_type='warning')
            self.log(f"  -> Deleting it to prepare for overwrite...", log_type='warning')
            if not is_test_mode:
              try:
                shutil.rmtree(new_path)
                self.log("  -> Deletion successful.", log_type='success')
              except OSError as e:
                self.log(f"  -> Error: Could not delete '{new_path}' - {e}", log_type='error')
                continue # Skip this folder and move to the next

          self.log(f"  -> Cloning to '{new_path}'...", log_type='info')
          if not is_test_mode:
            try:
              shutil.copytree(original_path, new_path)
              self.log("  -> Done.", log_type='success')
            except shutil.Error as e:
              self.log(f"  -> Error: {e}", log_type='error')
          
          self.log("-----------------------------------------")

    if not found_folders:
      self.log("No target folders were found in the directory tree.", log_type='warning')
      self.log("-----------------------------------------")

    self.log("--- Operation complete ---", log_type='info')

if __name__ == "__main__":
  root = tk.Tk()
  app = DatapackClonerApp(root)
  root.mainloop()
