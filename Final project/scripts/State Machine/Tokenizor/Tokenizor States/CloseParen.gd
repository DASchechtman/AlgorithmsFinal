extends "CharState.gd"

func createAndAddToken(var token_array):
	var token = TOKEN.new()
	token.name = token_name
	token.type = "close paren"
	token_array.push_back(token)

func letter(var context, var token_array):
	pass
	
func symbol(var context, var token_array):
	pass
	
func string(var context, var token_array):
	pass
	
func num(var context, var token_array):
	pass
	
func whiteSpace(var context, var token_array):
	createAndAddToken(token_array)
	var white_space_state = preload("WhiteSpaceState.gd").new()
	context.setState(white_space_state)
	
func openParen(var context, var token_array):
	pass
	
func closeParen(var context, var token_array):
	pass

func comma(var context, var token_array):
	pass