extends Reference

var OPERATIONS = {
	"set": funcref(self, "callLoadOp"),
	"call expression": funcref(self, "callFunc"),
	"for loop": funcref(self, "runForLoop")
 }

var variable_table = {}
var command = null
var out_put_editor = null

func interpret(var editor, var ast):
	command = null
	out_put_editor = editor
	for instruction in ast.body:
		command = instruction
		OPERATIONS[command.oper].call_func()
		

func callLoadOp():
	command.call.call_func(command, variable_table)

func callFunc():
	command.call.call_func(out_put_editor, command, variable_table)

func runForLoop():
	command.call.call_func(out_put_editor, self, command.iter, command.ast)