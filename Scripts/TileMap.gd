extends TileMap

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func damage_on_tile(pos, damage):
	var ground_tile_id = tile_set.find_tile_by_name("Ground")
	var hardwall_tile_id = tile_set.find_tile_by_name("HardWall")
	if get_cellv(world_to_map(pos)) == hardwall_tile_id:
		return
	set_cellv(world_to_map(pos), ground_tile_id)