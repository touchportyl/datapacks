# Generates coordinates for a Minecraft function in a spherical shell around the player. The generated commands are saved to a text file, and the user is prompted for confirmation before generation. Change the inner and outer radius and the command template as needed.

import tkinter as tk
from tkinter import messagebox

inner_r = 1
outer_r = 7

inner_r_sq = inner_r ** 2
outer_r_sq = outer_r ** 2

coordinates = []
for x in range(-outer_r, outer_r + 1):
    for y in range(-outer_r, outer_r + 1):
        for z in range(-outer_r, outer_r + 1):
            dist_sq = x*x + y*y + z*z
            if inner_r_sq <= dist_sq <= outer_r_sq:
                coordinates.append((x, y, z))

root = tk.Tk()
root.withdraw()  # Hide the main window

num_commands = len(coordinates)
response = messagebox.askyesno("Confirm Generation", f"This will generate {num_commands} commands. Proceed?")

if response:
    with open('generated_commands.txt', 'w') as f:
        for x, y, z in coordinates:
            f.write(f"execute positioned ~{x} ~{y} ~{z} if block ~ ~ ~ minecraft:gold_block run function racetotheend:goldradar/spawn\n")
    print(f"Generated {num_commands} commands in generated_commands.txt")
else:
    print("Generation cancelled.")