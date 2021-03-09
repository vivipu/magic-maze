extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

const SPEED = 500
var motion = Vector2()
func _process(delta):
	#var vec = get_viewport().get_mouse_position() - self.position # getting the vector from self to the mouse
	#vec = vec.normalized() * delta * SPEED # normalize it and multiply by time and speed
	#position += vec # move by that vector
	var speed = 3
	var motion = Vector2()
	var mouse = get_viewport().get_mouse_position()
	self.position = mouse
	motion += (Vector2(mouse))
	look_at(mouse)
	motion = motion.normalized() * speed
	#move_and_collide(motion)
