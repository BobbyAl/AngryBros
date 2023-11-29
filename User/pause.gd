extends AnimatedSprite2D

func _on_pause_button_pressed():
	get_tree().change_scene_to_file("res://Menu.tscn")
