extends Node3D

@export var coin_scene: PackedScene  # Drag and drop your Coin scene here
@export var terrain_size: Vector2 = Vector2(90, 90)  # Set the size of the terrain (width, height)
@export var coin_count: int = 100  # Number of coins to spawn

func _ready() -> void:
	spawn_coins()

# Function to spawn coins at random positions on the terrain
func spawn_coins():
	for i in range(coin_count):
		var rand_x = randf_range(-terrain_size.x / 2, terrain_size.x / 2)
		var rand_z = randf_range(-terrain_size.y / 2, terrain_size.y / 2)
		var rand_position = Vector3(rand_x, 0, rand_z)
		var coin_instance = coin_scene.instantiate()
		
		#Debug Output
		print("Spawning coin at: ", rand_position)
		coin_instance.position = rand_position
		coin_instance.position.y = get_terrain_height(rand_x,rand_z)
		coin_instance.scale = Vector3(2.444 , 2.444, 2.444)
		add_child(coin_instance)



# Function to get the terrain height at a given position (you may use a heightmap or terrain data)
func get_terrain_height(x: float, z: float) -> float:
	# Placeholder logic for terrain height (e.g., using a heightmap or some function)
	# For simplicity, returning 0 here, but this would need to be replaced by actual logic.
	return 1.0
