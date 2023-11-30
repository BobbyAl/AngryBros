extends Node

# Assuming you have saved your enemy and coin as PackedScene resources
var enemy_scene = preload("res://scene/enemies.tscn")
var coin_scene = preload("res://scene/coins.tscn")
var spawn_timer


func _ready():
	MusicController.stop_music()
	MusicController.play_bg_music()
	setup_timer()

func setup_timer():
	spawn_timer = Timer.new()
	spawn_timer.wait_time = 2 # Time in seconds between spawns
	spawn_timer.autostart = true
	spawn_timer.connect("timeout", _on_spawn_timer_timeout)
	add_child(spawn_timer)

func _on_spawn_timer_timeout():
	spawn_enemies(1) # Spawn 1 enemy each interval
	spawn_coins()

func spawn_enemies(number_of_enemies):
	for i in range(number_of_enemies):
		var potential_position = Vector2(randf_range(-950, 1024), randf_range(-1000, 768))
		var new_enemy = enemy_scene.instantiate()
		new_enemy.position = potential_position
		add_child(new_enemy)

func spawn_coins():
	var spawn_point = Vector2(randf_range(-950, 1024), randf_range(-1000, 768))
	var new_coin = coin_scene.instantiate()
	new_coin.position = spawn_point
	add_child(new_coin)
	
