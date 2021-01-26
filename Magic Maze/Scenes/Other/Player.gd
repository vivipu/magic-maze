extends KinematicBody2D

func _ready():
	pass 
	
var movespeed = 200
#player movement
func _physics_process(delta):
	var motion = Vector2()
	if Input.is_action_pressed("up"):
		motion.y -= 0.75
	if Input.is_action_pressed("down"):
		motion.y += 0.75
	if Input.is_action_pressed("right"):
		motion.x += 0.75
	if Input.is_action_pressed("left"):
		motion.x -= 0.75
	motion = motion.normalized()
	motion = move_and_slide(motion * movespeed)
onready var counter = 5

