extends CanvasLayer

@onready var black_bar_animator: AnimationPlayer = %BlackBarAnimator

@onready var christine_animation: AnimationPlayer = $ChristineAnimation
@onready var nico_animation: AnimationPlayer = $NicoAnimation

@onready var christine_sprite: AnimatedSprite2D = $ChristineSprite


var christine_position_tween : Tween
var christine_modulate_tween : Tween


func _ready() -> void:
	$ChristineAnimation.play("test_animation")
	

	
func interuption_test():
	await get_tree().create_timer(1.5).timeout
	#$NicoAnimation.stop(true)
	for tween in get_tree().get_processed_tweens():
		tween.stop()
	var tween : Tween = get_tree().create_tween()
	
	tween.tween_property($NicoDupe,"position",Vector2(0,1536),1).set_ease(Tween.EASE_IN_OUT)


func interrupt_christine_animator()->void:
	$ChristineAnimation.stop(true)

func swap_animation_frames_christine()->void:
	
	interrupt_christine_animator()
	
	var christine_og_position = christine_sprite.position
	
	christine_position_tween = get_tree().create_tween()
	christine_modulate_tween = get_tree().create_tween().parallel()
	
	christine_position_tween.tween_property($ChristineSprite,"position",christine_sprite.position + Vector2(500,-1),.1).set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_CUBIC)
	christine_modulate_tween.tween_property($ChristineSprite,"modulate",Color(1,1,1,.4),.1).set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_CUBIC)
	$ChristineSprite.play("Talking")
	await christine_position_tween.finished
	christine_position_tween = get_tree().create_tween()
	christine_modulate_tween = get_tree().create_tween().parallel()
	
	christine_position_tween.tween_property($ChristineSprite,"position",christine_og_position,.1).set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_CUBIC)
	christine_modulate_tween.tween_property($ChristineSprite,"modulate",Color(1,1,1,1),.1).set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_CUBIC)
	
	
	

func _input(event: InputEvent) -> void:
	if event is InputEventKey:
		
		if event.pressed == true and event.as_text_physical_keycode() == "0":
			swap_animation_frames_christine()


#reciever for any commands
func play_command(command : String)->void:
	
	
	pass
	
	
func activate_black_bars()->void:
	black_bar_animator.play("BlackBarAnimation")
	
func deactivate_black_bars()->void:
	black_bar_animator.play("BlackBarAnimation")
