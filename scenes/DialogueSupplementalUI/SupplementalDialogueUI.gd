extends CanvasLayer

@onready var black_bar_animator: AnimationPlayer = %BlackBarAnimator

#reciever for any commands
func play_command(command : String)->void:
	pass
	
	
func activate_black_bars()->void:
	black_bar_animator.play("BlackBarAnimation")
	
func deactivate_black_bars()->void:
	black_bar_animator.play("BlackBarAnimation")
