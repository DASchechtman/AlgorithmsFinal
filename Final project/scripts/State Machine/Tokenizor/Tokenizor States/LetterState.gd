#LETTER STATE

extends "CharState.gd"

var DATA_TYPES = ["String", "Number", "Bool"]
var LOOPS = ["Repeat", "While"]
var BUILT_IN_FUNCS = ["Print"]
var KEY_WORDS = ["Times"]
var SCOPE = ["Start", "End"]

func createAndAddToken(token_array):
	var token = TOKEN.new()
	token.name = token_name
	token.type = "variable"
	if KEY_WORDS.has(token_name):
		token.type = "keyword"
	elif SCOPE.has(token_name):
		token.type = "scope"
	elif DATA_TYPES.has(token_name):
		token.type = "data type"
	elif BUILT_IN_FUNCS.has(token_name):
		token.type = "function"
	elif LOOPS.has(token_name):
		token.type = "loop"
	elif token_name == "true":
		token.name = true 
		token.type = "bool literal"
	elif token_name == "false":
		token.name = false
		token.type = "false literal"
		
	token_array.push_back(token)

func letter(var context, var token_array):
	token_name += context.getCharacter()
	
func symbol(var context, var token_array):
	createAndAddToken(token_array)
	var symbol_state = preload("SymbolState.gd").new()
	symbol_state.add(context.getCharacter())
	context.setState(symbol_state)
	
func string(var context, var token_array):
	pass
	
func num(var context, var token_array):
	pass
	
func whiteSpace(var context, var token_array):
	createAndAddToken(token_array)
	var white_space_state = preload("WhiteSpaceState.gd").new()
	context.setState(white_space_state)

func openParen(var context, var token_array):
	createAndAddToken(token_array)
	var open_paren_state = preload("OpenParen.gd").new()
	open_paren_state.add(context.getCharacter())
	context.setState(open_paren_state)

func closeParen(var context, var token_array):
	createAndAddToken(token_array)
	var close_paren_state = preload("CloseParen.gd").new()
	close_paren_state.add(context.getCharacter())
	context.setState(close_paren_state)

func comma(var context, var token_array):
	createAndAddToken(token_array)
	var comma_state = preload("CommaState.gd").new()
	comma_state.add(context.getCharacter())
	context.setState(comma_state)
