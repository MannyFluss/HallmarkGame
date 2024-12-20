extends Node2D

@export
var speed = 200
@export
var enabled = false

@onready var animatable_body_2d: AnimatableBody2D = $AnimatableBody2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer

@onready var right_side: CollisionPolygon2D = $AnimatableBody2D/RightSide


func _process(delta: float) -> void:
	pass
	
func _physics_process(delta: float) -> void:
	if !enabled:
		return
	
	if Input.is_action_pressed("action_down"):
		animatable_body_2d.position.y += speed * delta

	if Input.is_action_pressed("action_up"):
		animatable_body_2d.position.y -= speed  * delta

	if Input.is_action_pressed("action_left"):
		animatable_body_2d.position.x -= speed  * delta

	if Input.is_action_pressed("action_right"):
		animatable_body_2d.position.x += speed  * delta
	
	if Input.is_action_pressed("action_engage") and !animation_player.is_playing():
		print(right_side.rotation_degrees)
		if  roundf(right_side.rotation_degrees) == -20:
			animation_player.play("Grab")
		else:
			animation_player.play_backwards("Grab")
	
	
