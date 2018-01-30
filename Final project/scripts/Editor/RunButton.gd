extends Button

onready var EDITOR = get_node("../../Editor")
onready var OUTPUT_SCREEN = get_tree().get_root().get_node("Node2D/Output/Output Screen")
var TOKENIZER = preload("res://scripts/State Machine/Tokenizor/Tokenizer.gd").new()
var PARSER = preload("res://scripts/State Machine/Parser/Parser.gd").new()
var CODE_GENERATOR = preload("res://scripts/State Machine/Transformer/Transformer.gd").new()

func _ready():
	connect("pressed", self, "buttonPressed")
	
func sayHello():
	print("hello")
	
func buttonPressed():
	saveTextToFile()
	EDITOR.clear()
	
	var tokens = []
	for line in getFileText():
		TOKENIZER.generateTokens(line, tokens)
		TOKENIZER.resetState()
	var ast = PARSER.generateAST(tokens, OUTPUT_SCREEN)
	if ast[1]:
		var vm_code = CODE_GENERATOR.generateCode(ast[0], {type = "program", body = []})
		EDITOR.interpret(vm_code)

func getFileText():
	var file = File.new()
	var source_code = []
	
	# gets each line of code from file
	file.open("user://source_code.txt", file.READ)
	if file.get_len() > 0:
		while not file.eof_reached():
			source_code.push_back(file.get_line() + "\n")
	file.close()
	
	# gets the last line of source code
	var last_el_index = source_code.size() - 1
	var last_element = source_code[last_el_index]
	
	# removes the newline ('\n') character from the last
	# line of code
	var string_size = last_element.length() - 1
	last_element = last_element.substr(0, string_size)
	source_code[last_el_index] = last_element
	
	return source_code

func saveTextToFile():
	var file = File.new()
	file.open("user://source_code.txt", file.WRITE)
	file.store_string(EDITOR.get_text())
	file.close()