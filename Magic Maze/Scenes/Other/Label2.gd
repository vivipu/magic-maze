extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
var event = load("res://Scenes/Levels (Maps)/functionalitytest.gd").new()
# Called when the node enters the scene tree for the first time.
func _ready():
	event.lives = self.event.lives
	self.set_text(str(event.lives))
