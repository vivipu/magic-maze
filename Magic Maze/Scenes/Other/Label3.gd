extends Label

var event = load("res://global.gd").new()
#set text
func _ready():
	event.score = self.event.score
	self.set_text(str(event.score))
