#WHITE SPACE STATE

extends "CharState.gd"
	
func letter(var context, var token_array):
	var letter_state = preload("LetterState.gd").new()
	letter_state.add(context.getCharacter())
	context.setState(letter_state)
	
	
func symbol(var context, var token_array):
	var symbol_state = preload("SymbolState.gd").new()
	symbol_state.add(context.getCharacter())
	context.setState(symbol_state)
	
func string(var context, var token_array):
	var string_state = preload("StringState.gd").new()
	context.setState(string_state)
	
func num(var context, var token_array):
	var num_state = preload("NumState.gd").new()
	num_state.add(context.getCharacter())
	context.setState(num_state)
	
func whiteSpace(var context, var token_array):
	pass

func openParen(var context, var token_array):
	var open_paren_state = preload("OpenParen.gd").new()
	open_paren_state.add(context.getCharacter())
	context.setState(open_paren_state)

func closeParen(var context, var token_array):
	pass

func comma(var context, var token_array):
	var comma_state = preload("CommaState.gd").new()
	comma_state.add(context.getCharacter())
	context.setState(comma_state)