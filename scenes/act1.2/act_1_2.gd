extends Node2D


# Called when the node enters the scene tree for the first time.
const S_3_HOME = preload("res://scenes/act 1/s3-home.dtl")


func _ready() -> void:
	Dialogic.start(S_3_HOME)
	
	pass
	
	#Dialogic.timeline_ended.connect(on_timeline_ended)
	#Dialogic.timeline_started.connect(on_timeline_started)
	#start_crane_game()
	#$CraneGameContainer.modulate = Color(1,1,1,0)

func on_timeline_started()->void:
	Dialogic.start(S_3_HOME)
	
func on_timeline_ended()->void:
	start_crane_game()
	
func start_crane_game()->void:
	pass
	
