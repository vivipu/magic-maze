extends Control

onready var fadeInRect = $FadeIn
onready var vars = get_node("/root/Global")
func _ready():
	vars.score = 0
#button press functions
func _on_Leaderboard_pressed():
	get_tree().change_scene("res://addons/silent_wolf/Scores/Leaderboard.tscn")
func _on_Start_pressed():
	get_tree().change_scene("res://Scenes/Levels (Maps)/levelskeleton.tscn")
func _on_Fullscreen_pressed():
	OS.window_fullscreen = !OS.window_fullscreen
func _on_Quit_pressed():
	get_tree().quit()
