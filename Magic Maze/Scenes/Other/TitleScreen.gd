extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
#function for leaderboard
onready var fadeInRect = $FadeIn

#function for first level

#button press functions
func _on_Leaderboard_pressed():
	get_tree().change_scene("res://addons/silent_wolf/Scores/Leaderboard.tscn")
func _on_Start_pressed():
	get_tree().change_scene("res://Scenes/Levels (Maps)/functionalitytest.tscn")
func _on_Fullscreen_pressed():
	OS.window_fullscreen = !OS.window_fullscreen
