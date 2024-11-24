extends CanvasLayer

@onready var black_bar_animator: AnimationPlayer = %BlackBarAnimator

@onready var christine_animation: AnimationPlayer = $ChristineAnimation
@onready var nico_animation: AnimationPlayer = $NicoAnimation




func _ready() -> void:
	interuption_test()
	var tween : Tween = get_tree().create_tween()
	tween.tween_property($NicoDupe,"position",Vector2(500,0),5).set_ease(Tween.EASE_IN_OUT)
	
	#await tween.finished
	#print("going off screen wee")
	#var tween2 : Tween = get_tree().create_tween()
	#tween2.tween_property($NicoDupe,"position",Vector2(1000,1536),5).set_ease(Tween.EASE_IN_OUT)
	##
	pass
	
	
func interuption_test():
	await get_tree().create_timer(1.5).timeout
	#$NicoAnimation.stop(true)
	print("interupt")
	for tween in get_tree().get_processed_tweens():
		
		tween.stop()
	var tween : Tween = get_tree().create_tween()
	
	tween.tween_property($NicoDupe,"position",Vector2(0,1536),1).set_ease(Tween.EASE_IN_OUT)


#reciever for any commands
func play_command(command : String)->void:
	
	
	pass
	
	
func activate_black_bars()->void:
	black_bar_animator.play("BlackBarAnimation")
	
func deactivate_black_bars()->void:
	black_bar_animator.play("BlackBarAnimation")
