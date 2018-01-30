extends Reference

var type = null setget setType, getType
var name = null setget setName, getName

func setType(var new_type):
	type = new_type

func getType():
	return type

func setName(var new_name):
	name = new_name
	
func getName():
	return name
