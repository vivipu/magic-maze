extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var path_follow
var timer = 0
func _ready():
	pass
func _physics_process(delta):
	pass
func _on_Timer_timeout():
	var motion = Vector2()
	var speed = 13
	var random_number = randi()% 4
func MovementLoop(delta):
	pass



