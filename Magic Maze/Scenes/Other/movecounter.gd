extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var status = get_parent().get_parent().get_node("Player")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
#decide what to do when popups show
func _on_Popup_about_to_show():
	get_tree().paused = true
func _on_Pause_about_to_show():
	get_tree().paused = true
func _on_GoalPopup_about_to_show():
	status.level_over = true
	yield(get_tree().create_timer(0.5), "timeout")
	get_tree().paused = true
