extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
#change to title
func _on_Button_pressed():
	get_tree().change_scene("res://Scenes/Other/TitleScreen.tscn")
	get_tree().paused = false
#change to functest
func _on_Button2_pressed():
	get_tree().change_scene("res://Scenes/Levels (Maps)/functionalitytest.tscn")
	get_tree().paused = false
