extends Node

var ast_generator = preload("ASTGenerator.gd").new()

func generateCode(var ast, var new_ast):
	var body = ast.body
	var vm_ast = new_ast
	for tree in body:
		var node = {}
		if tree.type == "data type" and tree.oper == "set":
			ast_generator.createLoadAst(node, tree)
		elif tree.type == "function":
			ast_generator.createFuncCallAst(node, tree)
		elif tree.type == "for loop":
			ast_generator.createForLoopAst(self, node, tree)
		vm_ast.body.push_back(node)
	return vm_ast