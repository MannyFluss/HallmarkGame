extends CanvasLayer

@onready var animation_player: AnimationPlayer = $AnimationPlayer

func SwitchScene(path : String)->void:
	animation_player.play("CircleTransition")
	
	await animation_player.animation_finished
	
	await get_tree().create_timer(.25).timeout
	get_tree().change_scene_to_file(path)
	await get_tree().create_timer(.25).timeout
	
	
	animation_player.play_backwards("CircleTransition")
	
#wait 1.05 sec
func DotEffectNoSceneSwitch()->void:
	animation_player.play("CircleTransition")
	
	await animation_player.animation_finished
	
	await get_tree().create_timer(.1).timeout
	
	
	animation_player.play_backwards("CircleTransition")
