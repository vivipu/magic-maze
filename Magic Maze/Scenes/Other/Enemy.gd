extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var path_follow
var timer = 0
func _ready():
	#timer for random enemy movement
	var _timer = Timer.new()
	add_child(_timer)
	_timer.connect("timeout", self, "_on_Timer_timeout")
	_timer.set_wait_time(0.3)
	_timer.set_one_shot(false) # Make sure it loops
	_timer.start()
func _physics_process(delta):
	var speed = 1.5
	var motion = Vector2()
	#if player close enough to enemy, chase player
	var distance = get_parent().get_node("Player").position.distance_to(get_parent().get_node("Enemy").position)
	if distance < 100:
		var Player = get_parent().get_node("Player")
		motion += (Vector2(Player.position) - position)
		#look_at(Player.position)
		motion = motion.normalized() * speed
		move_and_collide(motion)
func _on_Timer_timeout():
	var motion = Vector2()
	var speed = 13
	var random_number = randi()% 4
	#if player not close enough to enemy, move randomly
	var distance = get_parent().get_node("Player").position.distance_to(get_parent().get_node("Enemy").position)
	if distance > 100:
		match random_number:
			0: motion.x += 1
			1: motion.x -= 1
			2: motion.y += 1
			3: motion.y -= 1
		motion = motion.normalized() * speed
		move_and_collide(motion)




