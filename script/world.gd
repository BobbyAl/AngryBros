extends Node

# Assuming you have saved your enemy as a PackedScene resource
var enemy_scene = preload("res://scene/enemies.tscn")

func _ready():
	spawn_enemies(50) # Spawn 5 enemies

func spawn_enemies(number_of_enemies):
	var spawn_attempts = 0
	var max_spawn_attempts = 10
	var enemies_spawned = 0
	
	while enemies_spawned < number_of_enemies and spawn_attempts < max_spawn_attempts:
		var potential_position = Vector2(randf_range(0, 1024), randf_range(0, 768))
		var can_spawn = true

		# Check for collision with existing enemies
		for enemy in get_tree().get_nodes_in_group("enemies"):
			if potential_position.distance_to(enemy.position) < enemy.get_collision_shape_extent():
				can_spawn = false
				break
		
		# This if block should be outside the for-loop
		if can_spawn:
			var enemy = enemy_scene.instantiate()
			enemy.position = potential_position
			add_child(enemy)
			enemies_spawned += 1
		else:
			spawn_attempts += 1
