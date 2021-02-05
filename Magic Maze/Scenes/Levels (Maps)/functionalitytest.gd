extends Node2D
const tilemap = preload("res://Scenes/Levels (Maps)/functestmap.tscn")
const pickup = preload("res://Scenes/Other/Pickup.tscn")
var counter = 5
var lives = 3
var score = 0
var highScoreVal1
var highScoreVal2
var highScoreVal3
var highScoreVal4
var highScoreVal5
var savegame = File.new() #file
var save_path = "user://savegame.save" #place of the file
var save_data = {
	"1": highScoreVal1,
	"2": highScoreVal2
	} #variable to store data
func _ready():
	pass 
func kill():
	counter = 5
	$Moves/Counter/Label.text = str(counter)
	get_node("Moves/Counter/Popup").popup()
func game_over():
	# if score > highScoreVal1 or score > highScoreVal2 or score > highScoreVal3 or score > highScoreVal4 or score > highScoreVal5:
	#	get_node("Moves/Counter/HighScore").popup()
	get_node("Moves/Counter/Popup2")
onready var tile = get_node("TileMap")
func get_tile(mouse_pos): 
	var cell_pos = tile.world_to_map(mouse_pos) 
	return cell_pos
func _unhandled_input(event): 
	if event is InputEventMouseButton and event.is_pressed():
		var clicked = get_tile(event.position)
		if tile.get_cell(clicked.x, clicked.y) == 0:
			counter -= 1
			$Moves/Counter/Label.text = str(counter)
		if counter <= 0:
			kill()
			lives -= 1
			if lives <= 0:
				game_over()
			$Moves/Counter/Label2.text = str(lives)
		tile.set_cell(clicked.x, clicked.y, -1)		
func _on_Area2D_body_entered(body):
	if "Enemy" in body.name:
		counter -= 1
		$Moves/Counter/Label.text = str(counter)
		if counter < 0:
			kill()
	if "Pickup" in body.name:
		$Pickup.hide()
		score += 1
		$Moves/Counter/Label3.text = str(score)


func _on_Button2_pressed():
	var name = $"Moves/Counter/HighScore/NameEntry".text
	score = 0
