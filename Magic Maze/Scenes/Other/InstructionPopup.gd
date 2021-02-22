extends Popup

func _ready():
	pass # Replace with function body.
#button actions
func _on_Button_pressed():
	get_tree().change_scene("res://Scenes/Levels (Maps)/level1.tscn")
	get_tree().paused = false
func _on_Button2_pressed():
	get_tree().change_scene("res://Scenes/Other/Instructions.tscn")
	get_tree().paused = false

