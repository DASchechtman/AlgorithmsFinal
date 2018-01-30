extends Node

# This file is going to hold all the operations that the programming Language will
# hold. Basice mathimatical operations, loading variables into memory
# etc...

static func loadVar(var instruction, var variable_tbl):
	var name = instruction.left_operand
	var data = instruction.right_operand
	variable_tbl[name] = data


static func forLoop(var editor, var interpreter, var iter, var loop_data):
	var index = 0
	while index < iter:
		interpreter.interpret(editor, loop_data)
		index += 1