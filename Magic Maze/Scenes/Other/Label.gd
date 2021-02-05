extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var event = load("res://global.gd").new()
# Called when the node enters the scene tree for the first time.
#set text
func _ready():
	event.moves = self.event.moves
	self.set_text(str(event.moves))


