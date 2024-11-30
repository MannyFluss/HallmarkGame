extends Node2D

@export
var speed = 200
@export
var enabled = false

@export
var drop_speed = 500
@export
var drop_length = 1.5
@export
var drag_strength = 1

@export
var area_clamp_left : float = -500

@export
var area_clamp_right : float = 500

@export
var clamp_length = .5
@export
var clamp_by_deg = 20

@onready var right : AnimatableBody2D = %Right

@onready var left : AnimatableBody2D = %Left

@onready var right_side:  CollisionPolygon2D = $Right/RightSide
@onready var left_side : CollisionPolygon2D = $Left/LeftSide

@onready var avg_pos : Node2D = $AvgPos

var times_unclamped = 0

signal unclamped(times : int)

var state = "default"

signal reached_height

func _physics_process(delta: float) -> void:
	if !enabled:
		return
	
	avg_pos.position = (left.position + right.position)/2
	
	if Input.is_action_pressed("action_left"):
		right.velocity.x -= speed * delta
		left.velocity.x -= speed * delta
		if state == "default" and left.position.x < area_clamp_left:
			right.velocity.x = 0
			left.velocity.x = 0
	elif Input.is_action_pressed("action_right"):
		right.velocity.x += speed * delta
		left.velocity.x += speed * delta
		if state != "clamped" and right.position.x > area_clamp_right:
			right.velocity.x = 0
			left.velocity.x = 0
	else:
		right.velocity.x = lerpf(right.velocity.x,0.0,drag_strength * delta)
		left.velocity.x = lerpf(left.velocity.x,0.0,drag_strength * delta)
	
	if (Input.is_action_just_pressed("action_engage") and state == "default" and 
		area_clamp_left <= right.position.x and right.position.x <= area_clamp_right):
		on_started_dropping()
	if Input.is_action_just_pressed("action_engage") and state == "clamped":
		times_unclamped += 1
		unclamped.emit(times_unclamped)
		on_started_releasing()
		
	if state == "dropping":
		right.velocity.y += drop_speed * delta
		left.velocity.y += drop_speed * delta
	elif state == "rising":
		right.velocity.y -= drop_speed * delta
		left.velocity.y -= drop_speed * delta
	else:
		right.velocity.y = 0
		left.velocity.y = 0
	
	
	right.position += right.velocity * delta
	left.position += left.velocity * delta
	
	
	
	
	
func on_started_releasing()->void:
	state = "releasing..."
	var tween1 : Tween = get_tree().create_tween()
	var tween2 : Tween = get_tree().create_tween().parallel()
	
	tween1.tween_property(right_side,"rotation_degrees",right_side.rotation_degrees - clamp_by_deg,clamp_length)
	tween2.tween_property(left_side,"rotation_degrees",left_side.rotation_degrees + clamp_by_deg,clamp_length)
	
	await tween2.finished
	state = "default"
	
	
	
var started_drop_pos_y : float 
 

func on_started_dropping()->void:
	state = "dropping"
	started_drop_pos_y = avg_pos.position.y
	await get_tree().create_timer(drop_length).timeout

	state = "clamping..."
	
	#clamp
	var tween1 : Tween = get_tree().create_tween()
	var tween2 : Tween = get_tree().create_tween().parallel()
	
	tween1.tween_property(right_side,"rotation_degrees",right_side.rotation_degrees + clamp_by_deg,clamp_length)
	tween2.tween_property(left_side,"rotation_degrees",left_side.rotation_degrees - clamp_by_deg,clamp_length)
	
	await tween2.finished
	
	
	state = "rising"
	await get_tree().create_timer(drop_length).timeout
	#switch this later
	state = "clamped"
	
