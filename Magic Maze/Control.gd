extends Control


#esc = quit
func _input(event):
	if event is InputEventKey:
		if event.scancode == KEY_ESCAPE:
			get_tree().quit()
func _ready():
	pass # Replace with function body.
func _on_Singleplayer_pressed():
	get_tree().change_scene("res://Scenes/Levels (Maps)/level1.tscn")
func _on_Multiplayer_pressed():
	get_tree().change_scene("res://Scenes/Levels (Maps)/level1multi.tscn")
