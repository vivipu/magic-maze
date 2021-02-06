extends Control

func _ready():
	pass # Replace with function body.
#esc = quit
func _input(event):
	if event is InputEventKey:
		if event.scancode == KEY_ESCAPE:
			get_tree().quit()
#button press function
func _on_Instructions_pressed():
	get_tree().change_scene("res://Scenes/Other/Instructions.tscn")
