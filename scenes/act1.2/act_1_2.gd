extends Node2D


# Called when the node enters the scene tree for the first time.
const S_3_HOME = preload("res://scenes/act 1/s3-home.dtl")

@onready var supplemental_dialolgue_ui : CanvasLayer = $SupplementalDialolgueUi
@onready var act_animation_player: AnimationPlayer = $ActAnimationPlayer

func _ready() -> void:
	Dialogic.timeline_ended.connect(on_timeline_ended)
	Dialogic.timeline_started.connect(on_timeline_started)
	start_crane_game()
	$CraneGameContainer.modulate = Color(1,1,1,0)

func on_timeline_started()->void:
	Dialogic.start(S_3_HOME)
	
func on_timeline_ended()->void:
	start_crane_game()
	
func start_crane_game()->void:
	supplemental_dialolgue_ui.play_command("christine_go_to_brain_anchor")
	await get_tree().create_timer(1.5).timeout
	supplemental_dialolgue_ui.play_command("christine_push_right")
	await get_tree().create_timer(1.5).timeout
	
	act_animation_player.play("brain_time")
	await act_animation_player.animation_finished
	var tween : Tween = get_tree().create_tween()
	tween.tween_property($CraneGameContainer,"modulate",Color(1,1,1,1),.4)
	
	
	
