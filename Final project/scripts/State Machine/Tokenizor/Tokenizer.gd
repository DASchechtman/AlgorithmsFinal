extends Node

var LETTER_STATE_PATH = "res://scripts/State Machine/States/LetterState.gd"
var SYMBOLS = ["<", ">", "-", "+", "="]

var state = null
var character = null
var char_index = null
var source_code = null


func _init():
	state = preload("Tokenizor States/LetterState.gd").new()
	

func generateTokens(var source_code, var parsed_tokens):
	self.source_code = source_code
	var token_array = []
	
	character = null
	char_index = 1
	
	for char in source_code:
		if char != "\n":
			character = char
			
		if (char >= 'a' and char <= 'z') or (char >= 'A' and char <= 'Z'):
			state.letter(self, token_array)
		elif SYMBOLS.has(char):
			state.symbol(self, token_array)
		elif char == '"':
			state.string(self, token_array)
		elif char >= '0' and char <= '9':
			state.num(self, token_array)
		elif char == " ":
			state.whiteSpace(self, token_array)
		elif char == "(":
			state.openParen(self, token_array)
		elif char == ")":
			state.closeParen(self, token_array)
		elif char == ",":
			state.comma(self, token_array)
		
		char_index += 1
	
	if character != '"' and character != null:
		state.createAndAddToken(token_array)
	
	if not token_array.empty():
		parsed_tokens.push_back(token_array)

func resetState():
	state = preload("Tokenizor States/LetterState.gd").new()

func setState(var new_state):
	state = new_state

func getCharacter():
	return character

func getNextCharacter():
	var next_char = null
	var len = source_code.length()
	if char_index < source_code.length():
		next_char = source_code[char_index]
	return next_char