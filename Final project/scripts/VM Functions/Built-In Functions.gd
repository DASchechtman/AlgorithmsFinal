extends Node

static func loadPrintParams(var editor, var instruction, var variable_table):
	var func_params = []
	for el in instruction.params:
		if variable_table.has(el.name):
			func_params.push_back(variable_table[el.name])
		else:
			func_params.push_back(el.name)
	PrintData(editor, func_params)

static func PrintData(var editor, var list):
	var output = ""
	for el in list:
		if typeof(el) == typeof("string"):
			output += el + ", "
		elif typeof(el) == typeof(0) || typeof(el) == typeof(0.0):
			output += str(el) + ", "
		elif el == true:
			output += "true, "
		elif el == false:
			output += "false, "
	output = output.substr(0, output.length()-2)
	editor.add_text(output + "\n")