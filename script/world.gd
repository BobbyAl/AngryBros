extends Node

# Assuming you have saved your enemy and coin as PackedScene resources
var enemy_scene = preload("res://scene/enemies.tscn")
var coin_scene = preload("res://scene/coins.tscn")
var spawn_timer

func _ready():
	spawn_enemies(50)  # Spawn 50 enemies
	setup_timer()

func setup_timer():
	spawn_timer = Timer.new()
	spawn_timer.wait_time = 2  # Time in seconds between spawns
	spawn_timer.autostart = true
	spawn_timer.connect("timeout", _on_spawn_timer_timeout)
	add_child(spawn_timer)

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
		
		if can_spawn:
			var new_enemy = enemy_scene.instantiate()
			new_enemy.position = potential_position
			add_child(new_enemy)
			enemies_spawned += 1
		else:
			spawn_attempts += 1

func _on_spawn_timer_timeout():
	spawn_coins()

func spawn_coins():
	var spawn_point = Vector2(randf_range(-950, 1024), randf_range(-1000, 768))
	var new_coin = coin_scene.instantiate()
	new_coin.position = spawn_point
	add_child(new_coin)

