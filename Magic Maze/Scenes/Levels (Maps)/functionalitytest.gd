extends Node2D


func _ready():
	pass 
	
onready var tile = get_node("TileMap")
onready var counter = get_node("Moves/Counter")

func get_tile(mouse_pos): 
	var cell_pos = tile.world_to_map(mouse_pos) 
	return cell_pos
func _input(event): 
	if event is InputEventMouseButton and event.is_pressed(): 
		var clicked = get_tile(event.position) 
		tile.set_cell(clicked.x, clicked.y, -1)

