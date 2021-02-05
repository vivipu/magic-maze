extends Popup


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

onready var vars = get_node("/root/Global")
func _on_Button_pressed():
	vars.moves = 3
	vars.lives = 3
	vars.score = 0
	get_tree().reload_current_scene()
	get_tree().paused = false
