extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Dialogic.timeline_ended.connect(on_timeline_ended)
	Dialogic.timeline_started.connect(on_timeline_started)



func on_timeline_started()->void:
	
	pass

func on_timeline_ended()->void:
	start_crane_game()
	pass

func start_crane_game()->void:
	pass
