extends Reference

var TOKEN = preload("res://scripts/State Machine/Tokenizor/Token.gd")

var token_name = ""

func createAndAddToken(var token_array):
	pass

func letter(var context, var token_array):
	pass 
	
func symbol(var context, var token_array):
	pass
	
func string(var context, var token_array):
	pass
	
func num(var context, var token_array):
	pass
	
func whiteSpace(var context, var token_array):
	pass
	
func openParen(var context, var token_array):
	pass
	
func closeParen(var context, var token_array):
	pass

func comma(var context, var token_array):
	pass

func add(var char):
	token_name += char