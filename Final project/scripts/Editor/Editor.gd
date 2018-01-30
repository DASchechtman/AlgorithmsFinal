extends TextEdit

var interpreter = preload("res://scripts/Interpreter/Interpreter.gd").new()
onready var output_screen = get_tree().get_root().get_node("Node2D/Output/Output Screen")

func _ready():
	
	# gets an array with each element in the
	# array being a line of code. This was
	# because it made it easier to get the 
	var source_code = getFileText()
	set_text(source_code)

func getFileText():
	var file = File.new()
	var file_content = ""
	
	# gets each line of code from file, if the file
	# isn't empty
	file.open("user://source_code.txt", file.READ)
	if file.get_len() > 0:
		while not file.eof_reached():
			file_content += file.get_line() + "\n"
	file.close()
	
	# gets the length of the source code in the file
	var file_content_len = file_content.length()
	
	# removes the last character in the file
	# because that character is a newline ('\n')
	# and it doesn't need to be there
	file_content = file_content.substr(0, file_content_len - 1)
	return file_content

func interpret(var ast):
	interpreter.interpret(output_screen, ast)

func clear():
	output_screen.set_text("")