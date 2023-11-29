extends CharacterBody2D

class_name Player

signal healthChanged




var speed = 300
var player_state
var invulnerable = false # to prevent cont damage


var is_attacking = false 

func _physics_process(delta):
	var direction = Input.get_vector("left", "right", "up", "down") #go to project -> project settings -> input map, then create the keys with correct keybind
	is_attacking = Input.is_action_pressed("attack") #check if attack key is pressed
	
	var currrentHealth  #make health bar with 5 hearts 1 heart = bandages, 2 & 3 = default, 4 = muscular, 5 = hulk
	
	if is_attacking:
		player_state= "attacking"
	elif direction.x == 0 and direction.y == 0:
		player_state ="idle"
	else:
		player_state = "walking"
	
	if player_state != "attacking":
		velocity = direction * speed
		move_and_slide()
	
	
	play_anim(direction) # send function call with direction and currentHealth
	
func play_anim(dir): #player movement with animations # and get current health to decide what skin player should have on
	if player_state == "idle":
		$AnimatedSprite2D.play("Normal_idle")
	if player_state == "walking":
		if dir.y == -1:
			$AnimatedSprite2D.play("Normal_n_walk")
		if dir.x == 1:
			$AnimatedSprite2D.play("Normal_e_walk")
		if dir.x == -1:
			$AnimatedSprite2D.play("Normal_w_walk")
		if dir.y == 1:
			$AnimatedSprite2D.play("Normal_s_walk")
		if dir.x != 0 and dir.y > 0.5:
			$AnimatedSprite2D.play("Normal_s_walk")
		if dir.x != 0 and dir.y < -0.5:
			$AnimatedSprite2D.play("Normal_n_walk")
	if player_state == "attacking":
		if dir.y == -1:
			$AnimatedSprite2D.play("Normal_attack_n")
		elif dir.x == -1:
			$AnimatedSprite2D.play("Normal_attack_w")
		elif dir.x == 1:
			$AnimatedSprite2D.play("Normal_attack_e")
		elif dir.y == 1:
			$AnimatedSprite2D.play("Normal_attack_s")
			

func player():
	pass
