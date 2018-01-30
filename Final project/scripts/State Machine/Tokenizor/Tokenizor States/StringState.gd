#STRING STATE

extends "CharState.gd"

func createAndAddToken(var token_array):
	var token = TOKEN.new()
	token.name = token_name
	token.type = "string literal"
	token_array.push_back(token)

func letter(var context, var token_array):
	token_name += context.getCharacter()
	
func symbol(var context, var token_array):
	token_name += context.getCharacter()
	
func string(var context, var token_array):
	createAndAddToken(token_array)
	var new_state = null
	var char = context.getNextCharacter()
	if char == " ":
		new_state = preload("WhiteSpaceState.gd").new()
	elif char == ")":
		new_state = preload("CloseParen.gd").new()
		new_state.add(char)
	elif char == ",":
		new_state = preload("CommaState.gd").new()
		new_state.add(char)
	
	if new_state != null:
		context.setState(new_state)
	
func num(var context, var token_array):
	token_name += context.getCharacter()
	
func whiteSpace(var context, var token_array):
	token_name += context.getCharacter()

func openParen(var context, var token_array):
	token_name += context.getCharacter()
	
func closeParen(var context, var token_array):
	token_name += context.getCharacter()

func comma(var context, var token_array):
	token_name += context.getCharacter()