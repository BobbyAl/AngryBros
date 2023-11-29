extends Node2D

var selected = false
# Called when the node enters the scene tree for the first time.
var seed_type = 3 #buy


func _ready():
	$AnimatedSprite2D.play("default")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if selected :
		global_position =lerp(global_position, get_global_mouse_position(), 25 * delta)


func _on_area_2d_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("click"):
		
		selected = true

