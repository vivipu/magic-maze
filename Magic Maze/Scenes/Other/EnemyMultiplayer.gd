extends KinematicBody2D

onready var status = get_parent().get_node("Player")
#stop animation which plays by default
func _ready():
	$AnimatedSprite.stop()
var movespeed = 200
func _physics_process(delta):
	#move enemy player and play animation when 2nd player moves
	if not status.level_over:
		var motion = Vector2()
		if Input.is_action_pressed("up2"):
			motion.y -= 0.75
			$AnimatedSprite.play("Bat")
		if Input.is_action_pressed("down2"):
			motion.y += 0.75
			$AnimatedSprite.play("Bat")
		if Input.is_action_pressed("right2"):
			motion.x += 0.75
			$AnimatedSprite.play("Bat")
		if Input.is_action_pressed("left2"):
			motion.x -= 0.75
			$AnimatedSprite.play("Bat")
		#stop animation when buttons no longer pressed
		if Input.is_action_just_released("down2") or Input.is_action_just_released("left2") or Input.is_action_just_released("right2") or Input.is_action_just_released("up2"):
			$AnimatedSprite.stop()
		motion = motion.normalized()
		motion = move_and_slide(motion * movespeed)
	if status.level_over:
		$AnimatedSprite.stop()
