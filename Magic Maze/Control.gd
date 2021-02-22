extends Control

onready var vars = get_node("/root/Global")
#esc = quit
func _input(event):
	if event is InputEventKey:
		if event.scancode == KEY_ESCAPE:
			get_tree().quit()
func _ready():
	pass # Replace with function body.
func _on_Singleplayer_pressed():
	if vars.viewed_instructions == false:
		get_node("InstructionPopup").popup_centered()
	else:
		get_tree().change_scene("res://Scenes/Levels (Maps)/level1.tscn")
func _on_Multiplayer_pressed():
	if vars.viewed_instructions == false:
		get_node("InstructionPopup").popup_centered()
	else:
		get_tree().change_scene("res://Scenes/Levels (Maps)/level1multi.tscn")
	
