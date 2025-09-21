import tkinter as tk
from tkinter import filedialog, messagebox
import os
import shutil

class DatapackBootstrapper(tk.Tk):
    """
    A GUI application to bootstrap a new datapack project by cloning a starter
    pack and replacing specific strings in file and folder names and contents.
    """
    def __init__(self):
        super().__init__()
        self.title("Datapack Project Bootstrapper")
        self.geometry("600x400")
        self.config(bg='#f0f0f0')

        self.create_widgets()

    def create_widgets(self):
        """Sets up the GUI layout with labels, entry fields, and buttons."""
        # Main frame for padding and background color
        main_frame = tk.Frame(self, padx=20, pady=20, bg='#f0f0f0')
        main_frame.pack(expand=True, fill='both')

        # Use a grid layout for better alignment
        main_frame.grid_columnconfigure(1, weight=1)

        # Source Folder
        tk.Label(main_frame, text="Starter Pack Folder:", bg='#f0f0f0', font=('Arial', 10, 'bold')).grid(row=0, column=0, sticky='w', pady=5)
        self.source_path = tk.StringVar()
        tk.Entry(main_frame, textvariable=self.source_path, width=50).grid(row=0, column=1, sticky='we', padx=5)
        tk.Button(main_frame, text="Browse", command=self.browse_source_folder).grid(row=0, column=2, padx=5)

        # Destination Folder
        tk.Label(main_frame, text="New Project Folder:", bg='#f0f0f0', font=('Arial', 10, 'bold')).grid(row=1, column=0, sticky='w', pady=5)
        self.dest_path = tk.StringVar()
        tk.Entry(main_frame, textvariable=self.dest_path, width=50).grid(row=1, column=1, sticky='we', padx=5)
        tk.Button(main_frame, text="Browse", command=self.browse_dest_folder).grid(row=1, column=2, padx=5)

        # New Datapack Name
        tk.Label(main_frame, text="New Datapack Name:", bg='#f0f0f0', font=('Arial', 10, 'bold')).grid(row=2, column=0, sticky='w', pady=5)
        self.new_name = tk.StringVar()
        tk.Entry(main_frame, textvariable=self.new_name, width=50).grid(row=2, column=1, sticky='we', padx=5)

        # New Tag (e.g., 'MP')
        tk.Label(main_frame, text="New Datapack Tag:", bg='#f0f0f0', font=('Arial', 10, 'bold')).grid(row=3, column=0, sticky='w', pady=5)
        self.new_tag = tk.StringVar()
        tk.Entry(main_frame, textvariable=self.new_tag, width=50).grid(row=3, column=1, sticky='we', padx=5)

        # Action Button
        tk.Button(main_frame, text="Clone and Bootstrap", command=self.run_bootstrapper, font=('Arial', 12, 'bold'), fg='white', bg='#4CAF50', activebackground='#45a049', relief='raised', padx=10, pady=5).grid(row=4, column=0, columnspan=3, pady=20, sticky='we')

        # Status Label
        self.status_label = tk.Label(main_frame, text="Ready", bg='#f0f0f0', fg='#333', font=('Arial', 10, 'italic'))
        self.status_label.grid(row=5, column=0, columnspan=3, sticky='w')

    def browse_source_folder(self):
        """Opens a dialog to select the source folder."""
        folder = filedialog.askdirectory()
        if folder:
            self.source_path.set(folder)

    def browse_dest_folder(self):
        """Opens a dialog to select the destination folder."""
        folder = filedialog.askdirectory()
        if folder:
            self.dest_path.set(folder)

    def update_status(self, message):
        """Updates the status label with a new message."""
        self.status_label.config(text=message)
        self.update_idletasks()

    def run_bootstrapper(self):
        """Main function to orchestrate the cloning and renaming process."""
        source = self.source_path.get()
        dest = self.dest_path.get()
        new_name = self.new_name.get()
        new_tag = self.new_tag.get()

        # Input validation
        if not all([source, dest, new_name, new_tag]):
            messagebox.showerror("Error", "All fields must be filled out.")
            return
        if not os.path.isdir(source):
            messagebox.showerror("Error", "Source folder does not exist.")
            return

        self.update_status("Processing... Please wait.")

        # Define the strings to be replaced based on user input
        new_name_no_space = new_name.replace(" ", "")
        new_tag_no_space = new_tag.replace(" ", "")
        
        replacements = {
            "My Datapack": new_name,
            "MyDatapack": new_name_no_space,
            "mydatapack": new_name_no_space.lower(),
            "MD": new_tag_no_space,
            "z_md_": f"z_{new_tag_no_space.lower()}_",
            "MD_": f"{new_tag_no_space}_",
            "md_": f"{new_tag_no_space.lower()}_"
        }

        try:
            # 1. Clone the entire directory structure
            new_project_path = os.path.join(dest, os.path.basename(source))
            shutil.copytree(source, new_project_path)

            # 2. Walk the new project directory from the bottom up to rename files/folders
            #    This is important to avoid issues when renaming parent directories.
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
                        for old_str, new_str in replacements.items():
                            modified_content = modified_content.replace(old_str, new_str)

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

            self.update_status("Success! Project bootstrapped.")
            messagebox.showinfo("Success", f"Project successfully created at:\n{new_project_path}")
        
        except FileExistsError as e:
            self.update_status("Error: Destination folder already exists.")
            messagebox.showerror("Error", f"A folder named '{os.path.basename(source)}' already exists in the destination. Please delete it or choose a different destination.")
        except Exception as e:
            self.update_status(f"An unexpected error occurred: {e}")
            messagebox.showerror("Error", f"An unexpected error occurred:\n{e}")

# Run the application
if __name__ == "__main__":
    app = DatapackBootstrapper()
    app.mainloop()
