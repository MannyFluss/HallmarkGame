extends CanvasLayer

@onready var black_bar_animator: AnimationPlayer = %BlackBarAnimator


# christine stuffs
@onready var christine_animation: AnimationPlayer = %ChristineAnimation
@onready var christine_sprite: AnimatedSprite2D = %ChristineSprite

var christine_position_tween : Tween
var christine_modulate_tween : Tween

# nico stuffs
@onready var nico_animation: AnimationPlayer = %NicoAnimation
@onready var nico_sprite: AnimatedSprite2D = %NicoSprite

var nico_position_tween : Tween
var nico_modulate_tween : Tween



func _ready() -> void:
	pass
	

	


func christine_flush_anims()->void:
	$ChristineAnimation.stop(true)
	if christine_position_tween and christine_position_tween.is_running():
		christine_position_tween.kill()
	
func nico_flush_anims()->void:
	$NicoAnimation.stop(true)
	if nico_position_tween and nico_position_tween.is_running():
		nico_position_tween.kill()

func swap_animation_frames_christine(anim_name : String)->void:
	
	christine_flush_anims()
	
	var christine_og_position = christine_sprite.position
	
	christine_position_tween = get_tree().create_tween()
	christine_modulate_tween = get_tree().create_tween().parallel()
	
	christine_position_tween.tween_property($ChristineSprite,"position",christine_sprite.position + Vector2(500,-1),.1).set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_CUBIC)
	christine_modulate_tween.tween_property($ChristineSprite,"modulate",Color(1,1,1,.4),.1).set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_CUBIC)
	$ChristineSprite.play(anim_name)
	
	await christine_position_tween.finished
	christine_position_tween = get_tree().create_tween()
	christine_modulate_tween = get_tree().create_tween().parallel()
	
	christine_position_tween.tween_property($ChristineSprite,"position",christine_og_position,.1).set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_CUBIC)
	christine_modulate_tween.tween_property($ChristineSprite,"modulate",Color(1,1,1,1),.1).set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_CUBIC)

func go_to_brain_game_anchor()->void:
	christine_flush_anims()
	
	christine_position_tween = get_tree().create_tween()
	christine_position_tween.tween_property($ChristineSprite,"position",%BrainGameAnchor.position ,1.5).set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_CUBIC)
	
func christine_push(how_much : Vector2)->void:
	christine_flush_anims()
	christine_position_tween = get_tree().create_tween()
	
	christine_position_tween.tween_property($ChristineSprite,"position",christine_sprite.position + how_much,.5).set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_CUBIC)
	
func swap_animation_frames_nico(anim_name : String)->void:
	
	nico_flush_anims()
	
	var christine_og_position = nico_sprite.position
	
	nico_position_tween = get_tree().create_tween()
	nico_modulate_tween = get_tree().create_tween().parallel()
	
	nico_position_tween.tween_property(nico_sprite,"position",nico_sprite.position + Vector2(-500,-1),.1).set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_CUBIC)
	nico_modulate_tween.tween_property(nico_sprite,"modulate",Color(1,1,1,.4),.1).set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_CUBIC)
	nico_sprite.play(anim_name)
	
	await nico_modulate_tween.finished
	
	nico_position_tween = get_tree().create_tween()
	nico_modulate_tween = get_tree().create_tween().parallel()
	
	nico_position_tween.tween_property(nico_sprite,"position",christine_og_position,.1).set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_CUBIC)
	nico_modulate_tween.tween_property(nico_sprite,"modulate",Color(1,1,1,1),.1).set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_CUBIC)
	
func _input(event: InputEvent) -> void:
	if event is InputEventKey:
		if event.pressed == true and event.as_text_physical_keycode() == "0":
			play_command("nico_swap_to_cozy")
		if event.pressed == true and event.as_text_physical_keycode() == "1":
			play_command("nico_suave_entry")
		if event.pressed == true and event.as_text_physical_keycode() == "2":
			play_command("christine_go_to_brain_anchor")
		if event.pressed == true and event.as_text_physical_keycode() == "3":
			play_command("christine_push_right")

			
#reciever for any commands
func play_command(command : String)->void:
	match command:
		"nico_swap_to_cozy":
			swap_animation_frames_nico("idle_cozy")
		"nico_suave_entry":
			%NicoAnimation.play("test_animation")
		"christine_go_to_brain_anchor":
			go_to_brain_game_anchor()
		"christine_push_right":
			christine_push(Vector2(1000,0))
			
			pass
	
func activate_black_bars()->void:
	black_bar_animator.play("BlackBarAnimation")
	
func deactivate_black_bars()->void:
	black_bar_animator.play("BlackBarAnimation")
