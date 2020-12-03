extends Node2D
var counter = 5
var lives = 3
func _ready():
	pass 
func kill():
	counter = 5
	$Moves/Counter/Label.text = str(counter)
	get_node("Moves/Counter/Popup").popup()
func game_over():
	get_node("Moves/Counter/Popup2").popup()
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


func _on_Popup_about_to_show():
	$TileMap.set_process_input(false)


func _on_Popup_popup_hide():
	$TileMap.set_process_input(true)
