extends Node

func set(var parser, var node, var token_list):
	var complete_status = true
	var index = 0
	
	while index < token_list.size() - 1:
		if token_list[index].name == "Repeat":
			index += 1
			var data = setUpForLoop(node, token_list, index, complete_status)
			index = data[0]
			complete_status = data[1]
			if not complete_status:
				break
			else:
				parser.counter += 1
				parser.walk(node)
		elif token_list[index].name == "While":
			pass
		else:
			complete_status = false
			break
	
	return complete_status

func setUpForLoop(var node, var token_list, var index, var status):
	if token_list[index].type == "number literal":
		var iterations = token_list[index].name
		index += 1
		if token_list[index].type == "keyword" and token_list[index].name == "Times":
			index += 1
			if token_list[index].type == "scope" and token_list[index].name == "Start":
				node.type = "for loop"
				node.iter = iterations
				node.body = []
			else:
				status = false
		else:
			status = false
	else:
		status = false
	return [index, status]
