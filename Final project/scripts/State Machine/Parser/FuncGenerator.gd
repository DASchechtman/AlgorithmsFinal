extends Reference

func set(var parser, var node, var token_list):
	var index = 0
	
	# used to signify that there was a compiler error
	var complete_status = true
	
	# while loop used to get access to tokens before loop iteration
	# ends. Because there will be times when the parser will need to look at
	# the next token right after decideing what to do with the current token
	while index < token_list.size() - 1:
		var token = token_list[index]
		
		if token.type == "function":
			_setUpFunction(node, token)
	
			index += 1
			if token_list[index].type == "open paren":
				index = _getFunctinParameters(node, token_list, index)
			else:
				complete_status = false
				break
		elif token_list[index].type == "scope" and token_list[index].name == "Start":
			pass
	
	return complete_status

func _setUpFunction(var node, var token):
	node.type = token.type
	node.name = token.name
	node.params = []

func _getFunctinParameters(var node, var token_list, var index):
	index += 1
	while index < token_list.size()-1 and token_list[index].type != "close paren":
		var token = token_list[index].name
		if token_list[index].type != "comma":
			node.params.push_back({})
			var size = node.params.size() - 1
			var list = node.params
			list[size].data = token_list[index]
		index += 1
	return index