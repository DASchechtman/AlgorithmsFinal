extends Reference

func set(var node, var token_list):
	var complete_status = true
	var index = 0
	while index < token_list.size():
		var token = token_list[index]
		if token.type == "data type":
			node.type = token.type
			node.var_type = token.name
		elif token.type == "variable":
			node.name = token.name 
		elif token.type == "set":
			node.oper = token.type
			node.params = []
			while index < token_list.size() - 1:
				index += 1
				token = token_list[index]
				node.params.push_back({})
				var size = node.params.size() - 1
				var list = node.params
				list[size].data = token
		else:
			complete_status = false
			break
		index += 1
	return complete_status