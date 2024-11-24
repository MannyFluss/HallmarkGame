extends CanvasLayer

@onready var black_bar_animator: AnimationPlayer = %BlackBarAnimator

@onready var christine_animation: AnimationPlayer = $ChristineAnimation
@onready var nico_animation: AnimationPlayer = $NicoAnimation




func _ready() -> void:
	christine_animation.play("test_animation")
	activate_black_bars()
	nico_animation.play("test_animation")
	await christine_animation.animation_finished
	var tween : Tween = get_tree().create_tween()
	tween.tween_property($NicoDupe,"position",Vector2(982,1536),5).set_ease(Tween.EASE_IN_OUT)
	await tween.finished
	christine_animation.play("do a backflip")
	pass
	
#reciever for any commands
func play_command(command : String)->void:
	
	
	pass
	
	
func activate_black_bars()->void:
	black_bar_animator.play("BlackBarAnimation")
	
func deactivate_black_bars()->void:
	black_bar_animator.play("BlackBarAnimation")
