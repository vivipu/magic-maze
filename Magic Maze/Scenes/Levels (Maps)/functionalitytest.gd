extends Node2D
const tilemap = preload("res://Scenes/Levels (Maps)/functestmap.tscn")
const pickup = preload("res://Scenes/Other/Pickup.tscn")
var moves = 3
var lives = 3
var score = 0
func _ready():
	pass
#function for player losing moves
func kill():
	#reset moves
	moves = 3
	$CanvasLayer/Control/Counter/Label.text = str(moves)
	#show popup
	get_node("CanvasLayer/Control/Counter/Popup").popup_centered()
#function for game over
func game_over():
	#show popup
	moves = 0
	$CanvasLayer/Control/Counter/Label.text = str(moves)
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
		#lower moves if tile clicked
		if tile.get_cell(clicked.x, clicked.y) == 0:
			tile.set_cell(clicked.x, clicked.y, -1)
			moves -= 1
			$CanvasLayer/Control/Counter/Label.text = str(moves)
		#use kill() and game_over() functions
		if moves <= 0 and lives != 0:
			kill()
			lives -= 1
			if lives <= 0:
				game_over()
			$CanvasLayer/Control/Counter/Label2.text = str(lives)
		#delete tile
		#tile.set_cell(clicked.x, clicked.y, -1)
#detect collision with player
func _on_Area2D_body_entered(body):
	if "Enemy" in body.name:
		moves -= 1
		$CanvasLayer/Control/Counter/Label.text = str(moves)
		if moves < 0:
			kill()
	if "Pickup" in body.name:
		score += 1
		$CanvasLayer/Control/Counter/Label3.text = str(score)
		$Pickup.queue_free()
#enter high score on game over
func _on_Button2_pressed():
	var name = $"CanvasLayer/Control/Counter/HighScore/NameEntry".text
	SilentWolf.Scores.persist_score(name, score)
	SilentWolf.Scores.get_high_scores()
	$"CanvasLayer/Control/Counter/HighScore".hide()
	$"CanvasLayer/Control/Counter/Popup".hide()
	$"CanvasLayer/Control/Counter/Popup2".popup_centered()
#pause button
func _on_PauseButton_pressed():
	get_node("CanvasLayer/Control/Pause").popup_centered()
