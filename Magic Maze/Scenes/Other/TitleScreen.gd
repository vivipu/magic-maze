extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

#function for leaderboard
func load_leaderboard_screen():
	get_tree().change_scene("res://addons/silent_wolf/Scores/Leaderboard.tscn")
#function for first level
func load_first_level():
	get_tree().change_scene("res://Scenes/Levels (Maps)/functionalitytest.tscn")
func _ready():
	pass
#button press functions
func _on_Leaderboard_pressed():
	load_leaderboard_screen()
func _on_Start_pressed():
	load_first_level()
func _on_Fullscreen_pressed():
	OS.window_fullscreen = !OS.window_fullscreen
