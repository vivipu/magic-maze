extends Control

func _ready():
	pass # Replace with function body.
#esc = quit
func _input(event):
	if event is InputEventKey:
		if event.scancode == KEY_ESCAPE:
			get_tree().quit()
#button press functions
func _on_Title_pressed():
	get_tree().change_scene("res://Scenes/Other/TitleScreen.tscn")
func _on_Story_pressed():
	get_tree().change_scene("res://Scenes/Other/Story.tscn")
