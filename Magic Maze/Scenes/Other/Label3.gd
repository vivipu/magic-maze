extends Label

var event = load("res://Scenes/Levels (Maps)/functionalitytest.gd").new()
#set text
func _ready():
	event.score = self.event.score
	self.set_text(str(event.score))
