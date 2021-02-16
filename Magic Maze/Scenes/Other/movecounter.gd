extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
#pause game on popup
func _on_Popup_about_to_show():
	get_tree().paused = true
func _on_Pause_about_to_show():
	get_tree().paused = true
func _on_GoalPopup_about_to_show():
	get_tree().paused = true
