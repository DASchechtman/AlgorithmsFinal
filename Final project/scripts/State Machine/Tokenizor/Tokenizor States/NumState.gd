#NUMBER STATE

extends "CharState.gd"

func createAndAddToken(var token_array):
	var token = TOKEN.new()
	token.name = float(token_name)
	token.type = "number literal"
	token_array.push_back(token)

func letter(var context, var token_array):
	pass 
	
func symbol(var context, var token_array):
	pass
	
func string(var context, var token_array):
	pass
	
func num(var context, var token_array):
	token_name += context.getCharacter()
	
func whiteSpace(var context, var token_array):
	createAndAddToken(token_array)
	var white_space_state = preload("WhiteSpaceState.gd").new()
	context.setState(white_space_state)

func openParen(var context, var token_array):
	pass
	
func closeParen(var context, var token_array):
	createAndAddToken(token_array)
	var close_paren_state = preload("CloseParen.gd").new()
	close_paren_state.add(context.getCharacter())
	context.setState(close_paren_state)

func comma(var context, var token_array):
	pass