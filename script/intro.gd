extends Node2D

func _ready():
	MusicController.play_intro_music()
	$AnimationPlayer.play("Fade_in")
	await get_tree ().create_timer (6).timeout
	$AnimationPlayer.play("Fade_out")
	await get_tree ().create_timer (2).timeout
	get_tree().change_scene_to_file("res://scene/login_screen.tscn")
	

