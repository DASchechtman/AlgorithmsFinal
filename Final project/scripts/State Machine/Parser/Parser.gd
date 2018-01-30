extends Reference

var VARIABLE_GENERATOR = preload("VarGenerator.gd").new()
var FUNC_GENERATOR = preload("FuncGenerator.gd").new()
var LOOP_GENERATOR = preload("LoopGenerator.gd").new()

var counter = 0
var tokens = null

func generateAST(var tokens, var output):
	counter = 0
	var ast = {
		name = "program",
		body = []
	}
	self.tokens = tokens
	return [ast, walk(ast, output)]

func walk(var ast, var output_screen = null):
	var compile_state = true
	while counter < tokens.size():
		var token_list = tokens[counter]
		var size = token_list.size()
		var node = {}
		var token_type = token_list[0].type
		if token_list[0].type != "newline":
			if token_list[0].type == "data type":
				compile_state = VARIABLE_GENERATOR.set(node, token_list)
			elif token_list[0].type == "function":
				compile_state = FUNC_GENERATOR.set(self, node, token_list)
			elif token_list[0].type == "loop":
				compile_state = LOOP_GENERATOR.set(self, node, token_list)
			elif token_list[0].type == "scope" and token_list[0].name == "End":
				return true
			else:
				compile_state = false
		
		if output_screen != null and compile_state == false:
			output_screen.add_text("Error: line " + str(counter + 1))
			break
			
		if not node.empty():
			ast.body.push_back(node)
		counter += 1
	return compile_state