extends Node2D
class_name Act1

const S_1_CORPORATE = preload("res://scenes/act 1/s1-corporate.dtl")

func _ready() -> void:
	pass # Replace with function body.


func start_dialogic_timeline()->void:
	Dialogic.start_timeline(S_1_CORPORATE)
	
	pass
