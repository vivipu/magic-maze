extends Label

var event = load("res://Scenes/Levels (Maps)/functionalitytest.gd").new()
func _ready():
	event.score = self.event.score
	self.set_text(str(event.score))
