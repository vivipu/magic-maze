extends Node2D
const pickup = preload("res://Scenes/Other/Pickup.tscn")
onready var vars = get_node("/root/Global")
var loaded = load("res://global.gd")
var instanced = loaded.new()
#function for player losing moves
func check_mus_title():
	if get_node("/root/MusicTitle").playing:
		get_node("/root/MusicTitle").stop()
		get_node("/root/MusicTitle").seek(-1)
func _ready():
	check_mus_title()
	vars.moves = 3
	$CanvasLayer/Control/Counter/Label.text = str(vars.moves)
	$CanvasLayer/Control/Counter/Label2.text = str(vars.lives)
	$CanvasLayer/Control/Counter/Label3.text = str(vars.score)
	#section to decide whether to remove any pickups; might change this for 
	#find how many pickups there are
	#var pickup_size = get_tree().get_nodes_in_group("pickup").size()
	#create an array of pickups
	#var pickups = get_tree().get_nodes_in_group("pickup")
	#create counter	
	#var counter = vars.score
	#if difference between current and original score
	#if (vars.score - instanced.score) <= pickup_size and vars.score != 0:
	#	for x in pickups:
	#		pickup_size -= 1
	#		x.queue_free()
	#		if pickup_size == 0:
	#			break
func kill():
	vars.moves = 0
	$CanvasLayer/Control/Counter/Label.text = str(vars.moves)
	#show popup
	get_node("CanvasLayer/Control/Counter/Popup").popup_centered()
#function for game over
func game_over():
	#show popup
	vars.moves = 0
	$CanvasLayer/Control/Counter/Label.text = str(vars.moves)
	get_node("CanvasLayer/Control/Counter/HighScore").popup_centered()
onready var tile = get_node("TileMap")
#function for getting title player clicked
func get_tile(mouse_pos):
	var cell_pos = tile.world_to_map(mouse_pos) 
	return cell_pos
#function for player click
func _input(event):
	if event is InputEventMouseButton: # and event.is_pressed():
		var clicked = get_tile(event.position)
		#detect if tile is there
		if tile.get_cell(clicked.x, clicked.y) == 0:
			#delete tile
			tile.set_cell(clicked.x, clicked.y, -1)
			#remove a move if tile is clicked
			$BreakSound.play()
			vars.moves -= 1
			$CanvasLayer/Control/Counter/Label.text = str(vars.moves)
		#use kill() and game_over() functions
		if vars.moves < 0 and vars.lives != 0:
			kill()
			vars.lives -= 1
			if vars.lives <= 0:
				game_over()
			$CanvasLayer/Control/Counter/Label2.text = str(vars.lives)
	if event is InputEventKey:
		if event.scancode == KEY_ESCAPE:
			get_tree().quit()
#enter high score on game over
func _on_Button2_pressed():
	var name = $"CanvasLayer/Control/Counter/HighScore/NameEntry".text
	SilentWolf.Scores.persist_score(name, vars.score)
	SilentWolf.Scores.get_high_scores()
	$"CanvasLayer/Control/Counter/HighScore".hide()
	$"CanvasLayer/Control/Counter/Popup".hide()
	$"CanvasLayer/Control/Counter/Popup2".popup_centered()
#pause button
func _on_PauseButton_pressed():
	get_node("CanvasLayer/Control/Pause").popup_centered()


func _on_Area2D2_body_entered(body):
	if "Enemy" in body.name:
		vars.lives -= 1
		kill()
		$CanvasLayer/Control/Counter/Label2.text = str(vars.lives)
		if vars.lives <= 0:
			game_over()
		$CanvasLayer/Control/Counter/Label2.text = str(vars.lives)
	if "Pickup" in body.name:
		vars.score += 1
		vars.moves += 1
		$CanvasLayer/Control/Counter/Label.text = str(vars.moves)
		$CanvasLayer/Control/Counter/Label3.text = str(vars.score)
		$PickupSound.play()
		body.queue_free()
	if "Goal" in body.name:
		vars.score += vars.moves
		$CanvasLayer/Control/Counter/Label3.text = str(vars.score)
		$CanvasLayer/Control/GoalPopup.popup_centered()
