#!/usr/bin/env python
# Compiles the core script to be injected into the MROM console.

import os
import argparse

MODULE_FOLDER_NAME = "/modules"
CMD_FOLDER_NAME = "/commands"

def compile_folder(folder):
	output = ""
	list = os.listdir(folder)
	for name in list:
		if name.endswith(".as"):
			file = open(folder + "/" + name, "r")
			text = file.read()
			file.close()
			output += text + "\n"
	return output

def compile_commands(folder):
	output = ""
	help = []
	list = os.listdir(folder)
	for name in list:
		if name.endswith(".as"):
			file = open(folder + "/" + name, "r")
			text = file.read()
			if text.startswith("//"):
				header = text[2:text.index("\n")].split("|") # get command header
				aliases = header[0].split(",")
				arguments = header[1].split(",")
				description = header[2]
				help.append([aliases, arguments, description])
				top = ""
				for alias in aliases:
					top += "case \"" + alias + "\":\n" # form command aliases
				output += top + text + "\nbreak;\n"
	return output, help

def generate_docs(data):
	output = ""
	for command in data:
		aliases = command[0]
		arguments = command[1]
		description = command[2]
		output += "<details>\n<summary>" + aliases[0] + "</summary>\n\n"
		output += description + "\n\n"
		if len(aliases) > 1:
			output += "**Aliases:** " + ", ".join(aliases[1:]) + "\n\n"
		if len(arguments) > 0:
			output += "**Arguments:** " + ", ".join(arguments) + "\n\n"
		output += "</details>\n\n"
	return output

parser = argparse.ArgumentParser(
	prog='CompileCore',
	description='Compiles the core script to be injected into the MROM console.')
parser.add_argument('-i', '--input',
	default='./core',
	help='Path to input folder; contains actionscript code to combine')
parser.add_argument('-o', '--output',
	default='./core.as',
	help='Path to output file')
parser.add_argument('-d', '--docpath',
	default='./help.md',
	help='Path to output documentation file')

args = parser.parse_args()

module_folder = args.input + MODULE_FOLDER_NAME
cmd_folder = args.input + CMD_FOLDER_NAME

print("Loading base script...")
file = open(args.input + "/base.as", "r")
compiled_script = file.read()
file.close()
print("Base script loaded.")

print("Compiling modules...")
# Load, combine and insert modules
compiled_modules = compile_folder(module_folder)
compiled_script = compiled_script.replace("//$BASE_INIT", compiled_modules)
print("Modules inserted.")

print("Compiling commands...")
# Load, combine, format and insert commands
compiled_commands, help_data = compile_commands(cmd_folder)
compiled_script = compiled_script.replace("//$CMD_LIST", compiled_commands)
print("Commands inserted.")

print("Generating documentation...")
final_docs = open(args.docpath, "w")
final_docs.write(generate_docs(help_data))
final_docs.close()
print("Documentation generated! Saved to " + args.docpath)


print("Writing script...")
final_script = open(args.output, "w")
final_script.write(compiled_script)
final_script.close()
print("Script complete! Saved to " + args.output)