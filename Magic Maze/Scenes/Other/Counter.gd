extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func kill():
	queue_free()
	get_tree().reload_current_scene()
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


