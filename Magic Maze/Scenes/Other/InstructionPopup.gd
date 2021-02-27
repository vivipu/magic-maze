extends Popup
onready var playtype = get_node("/root/Control")
func _ready():
	pass # Replace with function body.
#button actions
func _on_Button_pressed():
	if playtype.single == true:
		get_tree().change_scene("res://Scenes/Levels (Maps)/level1.tscn")
	elif playtype.multi == true:
		get_tree().change_scene("res://Scenes/Levels (Maps)/level1multi.tscn")
	get_tree().paused = false
func _on_Button2_pressed():
	get_tree().change_scene("res://Scenes/Other/Instructions.tscn")
	get_tree().paused = false

