extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var event = load("res://Scenes/Levels (Maps)/functionalitytest.gd").new()
# Called when the node enters the scene tree for the first time.
func _ready():
	event.counter = self.event.counter
	self.set_text(str(event.counter))


