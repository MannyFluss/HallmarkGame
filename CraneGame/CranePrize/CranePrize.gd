extends Node2D
class_name CranePrize

@export
var prize_tracker_name : String = ""


func _obtained_prize()->void:
	$RigidBody2D/TopHalf/MarginContainer/Label.text = ""
	pass
