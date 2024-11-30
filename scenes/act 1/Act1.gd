extends Node2D
class_name Act1

@export_file("*.tscn")
var next_scene_path : String = ""

@onready var act_1_animator: AnimationPlayer = $Act1Animator

const S_1_CORPORATE = preload("res://scenes/act 1/s1-corporate.dtl")

func _ready() -> void:
	$AudioStreamPlayer.play()
	Dialogic.timeline_ended.connect(on_timeline_ended)
	Dialogic.timeline_started.connect(on_timeline_started)
	

func start_dialogic_timeline()->void:
	Dialogic.start(S_1_CORPORATE)
	
func on_timeline_started()->void:
	pass
	
func on_timeline_ended()->void:
	await get_tree().create_timer(.3).timeout
	SceneSwitcher.SwitchScene(next_scene_path)


func _on_recieving_field_prize_obtained(name: String) -> void:
	if name == "start_game":
		SceneSwitcher.DotEffectNoSceneSwitch()
		
		var tween : Tween = get_tree().create_tween()
		tween.tween_property($AudioStreamPlayer,"volume_db",-60,1)
	
		
		await get_tree().create_timer(1.05).timeout
		start_dialogic_timeline()
	if name == "credits":
		pass
		$Act1Animator.play("creditgs")
		
		#act_1_animator.play("start_game")
