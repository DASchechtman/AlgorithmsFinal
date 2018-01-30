extends Reference

# This file will hold all the fuctions that will be able to create
# all nessecary types of ASTs. An AST is a command that the interpreter uses to
# exacute a line of code from the source file

# creates an AST that will tell the interpreter to load
# data into memory
static func createLoadAst(var node, var tree):
	node.oper = "set"
	node.left_operand = tree.name
	node.right_operand = tree.params[0].data.name
	node.call = funcref(LanguageOps, "loadVar")

# creates a command to call built-in function
static func createFuncCallAst(var node, var tree):
	
	node.oper = "call expression"
	node.params = []
	
	for el in tree.params:
		node.params.push_back(el.data)
	
	node.call = funcref(BuiltInFuncs, "loadPrintParams")

static func createForLoopAst(var transformer, var node, var tree):
	node.oper = tree.type
	node.iter = tree.iter
	node.body = tree.body
	node.call = funcref(LanguageOps, "forLoop")
	
	# gets the body of the for loop
	node.ast = transformer.generateCode(node, {type = "for loop", body = []})
