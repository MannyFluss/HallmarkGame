extends CanvasLayer

@onready var animation_player: AnimationPlayer = $AnimationPlayer

func SwitchScene(path : String)->void:
	animation_player.play("CircleTransition")
	
	await animation_player.animation_finished
	get_tree().change_scene_to_file(path)
	
	animation_player.play_backwards("CircleTransition")
	
	
