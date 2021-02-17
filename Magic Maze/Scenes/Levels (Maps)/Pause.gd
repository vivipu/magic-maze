extends Popup

func _ready():
	pass # Replace with function body.
#button actions
func _on_Button_pressed():
	get_tree().change_scene("res://Scenes/Other/TitleScreen.tscn")
	get_tree().paused = false
func _on_Button2_pressed():
	hide()
	get_tree().paused = false
func _on_Button3_pressed():
	var vars = get_node("/root/Global")
	vars.lives -= 1
	get_parent().get_node("Counter/Label2").text = str(vars.lives)
	if vars.lives > 0:
		get_tree().reload_current_scene()
		get_tree().paused = false
	else:
		self.hide()
		get_parent().get_node("Counter/HighScore").popup_centered()
