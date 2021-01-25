extends ColorRect
signal fade_finished

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
export(String, FILE, "*.tscn") var next_scene_path
onready var animation = $AnimationPlayer
func _ready():
	pass
	#animation.play_backwards("fade_in")
func transition(next_scene_path):
	#animation.play("fade_in")
	#yield(animation, "animation_finished")
	# Changes the scene
	get_tree().change_scene(next_scene_path)
