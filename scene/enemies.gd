extends CharacterBody2D

var speed = 50

var health = 100
var damage

var dead = false
var player_in_area = false
var player_in_hitbox = false
var player
var can_take_damage = true

func _ready():
	dead = false
	
func _physics_process(delta):
	deal_with_damage()
	
	if !dead:
		$"Detection-area/CollisionShape2D".disabled = false
		if player_in_area:
			position += (player.position - position) / speed
			$AnimatedSprite2D.play("idle")
		else:
			$AnimatedSprite2D.play("idle")
		
	if dead:
		$"Detection-area/CollisionShape2D".disabled = true
		


func _on_detectionarea_body_entered(body):
	if body.has_method("player"):
		player_in_area = true
		player = body


func _on_detectionarea_body_exited(body):
	if body.has_method("player"):
		player_in_area = false
		
func deal_with_damage():
	if player_in_hitbox and Global.player_current_attack == true:
		if can_take_damage == true:
			health = health - 25
			$take_damage_cdown.start()
			can_take_damage = false
			print("slime health = ",health)
			if health <= 0:
				self.queue_free()

func enemies():
	pass


func _on_hitbox_body_entered(body):
	if body.has_method("player"):
		player_in_hitbox = true
		player = body


func _on_hitbox_body_exited(body):
	if body.has_method("player"):
		player_in_hitbox = false





func _on_take_damage_cdown_timeout():
	can_take_damage = true
