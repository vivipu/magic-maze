extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
var movespeed = 200
func _physics_process(delta):
	var motion = Vector2()
	if Input.is_action_pressed("up2"):
		motion.y -= 0.75
	if Input.is_action_pressed("down2"):
		motion.y += 0.75
	if Input.is_action_pressed("right2"):
		motion.x += 0.75
	if Input.is_action_pressed("left2"):
		motion.x -= 0.75
	motion = motion.normalized()
	motion = move_and_slide(motion * movespeed)
