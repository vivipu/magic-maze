extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func kill():
	queue_free()
	get_tree().reload_current_scene()
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
func _input(event): 
	if event is InputEventMouseButton and event.is_pressed(): 
		var val=int(self.get_text()) #get current value and convert  to int for math
		self.set_text(str(val-1))
		if val <= 0:
			kill()
