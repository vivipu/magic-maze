extends PathFollow2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var status = get_parent().get_parent().get_node("Player")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
func _process(delta):
	if not status.level_over:
		var speed = 200
		set_offset(get_offset() + speed * delta)
