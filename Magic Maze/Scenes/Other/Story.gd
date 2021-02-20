extends Control


func _ready():
	pass # Replace with function body.

#change scene
func _on_Instructions_pressed():
	get_tree().change_scene("res://Scenes/Other/Instructions.tscn")

