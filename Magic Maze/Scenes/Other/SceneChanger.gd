extends CanvasLayer

onready var animation_player = $AnimationPlayer
onready var black = $Control/Black
func scene_change(path, delay = 0.5):
	yield(get_tree().create_timer(delay), "timeout")
	animation_player.play("fade")
	yield(animation_player, "animation_finished")
	get_tree().change_scene(path)
	animation_player.play_backwards("fade")
