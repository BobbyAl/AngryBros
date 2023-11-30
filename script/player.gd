extends CharacterBody2D

class_name Player

signal healthChanged

var speed = 250 # can change accordingly
var player_state
var enemy_inattack_range = false
var enemy_attack_cooldown = true
var health = 100 # can change accordingly
var player_alive = true
var coins = 0
var coins_label: Label

var is_attacking = false 

func _physics_process(delta):
	enemy_attack()
	attack()
	update_health()
	
	if health <= 0:
		player_alive = false # go back to menu or something this is where you add it
		health = 0
		print("Angry Bro is no longer angry...")
		self.queue_free()  #replace this with end screen or something
	
	
	var direction = Input.get_vector("left-button", "right-button", "up-button", "down-button") #go to project -> project settings -> input map, then create the keys with correct keybind
	if Input.get_action_strength("right-button"):
		position.x += 200 * delta
	if Input.get_action_strength("left-button"):
		position.x += -200 * delta
	if Input.get_action_strength("up-button"):
		position.y += -200 * delta
	if Input.get_action_strength("down-button"):
		position.y += 200 * delta
		
	is_attacking = Input.is_action_pressed("attack") #check if attack key is pressed
	
	if is_attacking:
		player_state= "attacking"
	elif direction.x == 0 and direction.y == 0:
		player_state ="idle"
	else:
		player_state = "walking"
	
	if player_state != "attacking":
		velocity = direction * speed
		move_and_slide()
	
	
	
	play_anim(direction,health) # send function call with direction and currentHealth
	
func play_anim(dir,health): #player movement with animations # and get current health to decide what skin player should have on
	var state
	
	if health < 30:
		state = 1
	elif health > 30 and health < 60:
		state = 2
	elif health >= 70 and health < 100:
		state = 3
	elif health > 71:
		state = 4
	
		
	if state == 1:
			if player_state == "idle":
				$AnimatedSprite2D.play("Weak_idle")
			if player_state == "walking":
				if dir.y == -1:
					$AnimatedSprite2D.play("Weak_n_walk")
				if dir.x == 1:
					$AnimatedSprite2D.play("Weak_e_walk")
				if dir.x == -1:
					$AnimatedSprite2D.play("Weak_w_walk")
				if dir.y == 1:
					$AnimatedSprite2D.play("Weak_s_walk")
				if dir.x != 0 and dir.y > 0.5:
					$AnimatedSprite2D.play("Weak_s_walk")
				if dir.x != 0 and dir.y < -0.5:
					$AnimatedSprite2D.play("Weak_n_walk")
				
			if player_state == "attacking":
					if dir.y == -1:
						$AnimatedSprite2D.play("Weak_attack_n")
					elif dir.x == -1:
						$AnimatedSprite2D.play("Weak_attack_w")
					elif dir.x == 1:
						$AnimatedSprite2D.play("Weak_attack_e")
					elif dir.y == 1:
						$AnimatedSprite2D.play("Weak_attack_s")
		
	if state == 2:
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
			
	if state == 3:
			if player_state == "idle":
				$AnimatedSprite2D.play("Muscular_idle")
			if player_state == "walking":
				if dir.y == -1:
					$AnimatedSprite2D.play("Muscular_n_walk")
				if dir.x == 1:
					$AnimatedSprite2D.play("Muscular_e_walk")
				if dir.x == -1:
					$AnimatedSprite2D.play("Muscular_w_walk")
				if dir.y == 1:
					$AnimatedSprite2D.play("Muscular_s_walk")
				if dir.x != 0 and dir.y > 0.5:
					$AnimatedSprite2D.play("Muscular_s_walk")
				if dir.x != 0 and dir.y < -0.5:
					$AnimatedSprite2D.play("Muscular_n_walk")
				
			if player_state == "attacking":
					if dir.y == -1:
						$AnimatedSprite2D.play("Muscular_attack_n")
					elif dir.x == -1:
						$AnimatedSprite2D.play("Muscular_attack_w")
					elif dir.x == 1:
						$AnimatedSprite2D.play("Muscular_attack_e")
					elif dir.y == 1:
						$AnimatedSprite2D.play("Muscular_attack_s")
						
	if state == 4:
			if player_state == "idle":
				$AnimatedSprite2D.play("Hulk_idle")
			if player_state == "walking":
				if dir.y == -1:
					$AnimatedSprite2D.play("Hulk_n_walk")
				if dir.x == 1:
					$AnimatedSprite2D.play("Hulk_e_walk")
				if dir.x == -1:
					$AnimatedSprite2D.play("Hulk_w_walk")
				if dir.y == 1:
					$AnimatedSprite2D.play("Hulk_s_walk")
				if dir.x != 0 and dir.y > 0.5:
					$AnimatedSprite2D.play("Hulk_s_walk")
				if dir.x != 0 and dir.y < -0.5:
					$AnimatedSprite2D.play("Hulk_n_walk")
				
			if player_state == "attacking":
					if dir.y == -1:
						$AnimatedSprite2D.play("Hulk_attack_n")
					elif dir.x == -1:
						$AnimatedSprite2D.play("Hulk_attack_w")
					elif dir.x == 1:
						$AnimatedSprite2D.play("Hulk_attack_e")
					elif dir.y == 1:
						$AnimatedSprite2D.play("Hulk_attack_s")
	elif health == 0:
		get_tree().change_scene_to_file("res://scene/Died.tscn")
			

func _on_player_hitbox_body_entered(body):
	if body.has_method("enemies"):
		enemy_inattack_range = true
	
func _on_player_hitbox_body_exited(body):
	if body.has_method("enemies"):
		enemy_inattack_range = false
		
func enemy_attack():
	if enemy_inattack_range and enemy_attack_cooldown == true:
		health = health - 20
		enemy_attack_cooldown = false
		$attack_cooldown.start()
		print(health)

func attack():
	if Input.is_action_just_pressed("attack"):
		global.player_current_attack = true
		$deal_attack_cooldown.start()
		
func _ready():
	coins_label = $Coins
		

func player():
	pass
	
func GetCoin():
	coins += 1
	update_coin_label()
	
func update_coin_label():
	coins_label.text = "Coins: " + str(coins)
	
func player_shop_method():
	pass

func update_health():
	var healthbar = $EnergyBar_HealthBar
	healthbar.value = health
	
	#if health >= 100:
	#	healthbar.visible = false
	#else:
		#healthbar.visible = true
		

func _on_timer_timeout():
	enemy_attack_cooldown = true


func _on_deal_attack_cooldown_timeout():
	$deal_attack_cooldown.stop()
	global.player_current_attack = false
	is_attacking = false
