extends CharacterBody2D

var speed = 100


var health = 100
var player_inattack_zone = false

var dead = false
var player_in_area = false

var player
var can_take_damage = true

var separation_force = 100

func _ready():
	dead = false
	
func _physics_process(delta):
	deal_with_damage()
	separate_from_others()
	
	if !dead:
		$"Detection-area/CollisionShape2D".disabled = false
		if player_in_area:
			position += (player.position - position) / speed
			$AnimatedSprite2D.play("idle")
		else:
			$AnimatedSprite2D.play("idle")
		
	if dead:
		$"Detection-area/CollisionShape2D".disabled = true
		

func enemies():
	pass

func _on_detectionarea_body_entered(body):
	if body.has_method("player"):
		player_in_area = true
		player = body


func _on_detectionarea_body_exited(body):
	if body.has_method("player"):
		player_in_area = false
		






		
func deal_with_damage():
	if player_inattack_zone and global.player_current_attack == true:
		if can_take_damage == true:
			health = health - 20
			$take_damage_cdown.start()
			can_take_damage = false
			print("slime health = ", health) 
			if health <= 0:
				self.queue_free()     

func separate_from_others():
	var enemies = get_tree().get_nodes_in_group("enemies") # Assuming all enemies are in a group called "enemies"
	for enemy in enemies:
		if enemy == self:
			continue
		var distance_to_enemy = position.distance_to(enemy.position)
		if distance_to_enemy < 50: # Change 50 to your preferred minimum distance
			var push_vector = (position - enemy.position).normalized() * separation_force
			position += push_vector * get_process_delta_time()


func _on_take_damage_cdown_timeout():
	can_take_damage = true


func _on_hitbox_body_entered(body):
	if body.has_method("player"):
		player_inattack_zone = true
		player = body


func _on_hitbox_body_exited(body):
	if body.has_method("player"):
		player_inattack_zone = false
