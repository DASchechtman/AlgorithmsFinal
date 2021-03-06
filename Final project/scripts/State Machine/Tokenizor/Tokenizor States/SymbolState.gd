#SYMBOL STATE

extends "CharState.gd"

var SYMBOL_CHART = {
	"+": "plus",
	"-": "minus",
	"+=": "plus-equals",
	"-=": "minus-equals",
	"=": "set",
	"==": "equals",
	"<": "less",
	">": "greater",
	"<=": "less-equals",
	">=": "greater-equals"
}

func createAndAddToken(token_array):
	var token = TOKEN.new()
	token.name = token_name
	token.type = SYMBOL_CHART[token_name]
	token_array.push_back(token)

func letter(var context, var token_array):
	createAndAddToken(token_array)
	var letter_state = preload("LetterState.gd").new()
	letter_state.add(context.getCharacter())
	context.setState(letter_state)
	
func symbol(var context, var token_array):
	token_name += context.getCharacter()
	
func string(var context, var token_array):
	createAndAddToken(token_array)
	var string_state = preload("StringState.gd").new()
	context.setState(string_state)
	
func num(var context, var token_array):
	createAndAddToken(token_array)
	var num_state = preload("NumState.gd").new()
	num_state.add(context.getCharacter())
	context.setState(num_state)
	
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