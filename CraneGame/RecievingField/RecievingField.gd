extends Node2D


func _on_area_2d_body_entered(body: Node2D) -> void:
	var prize = body.get_parent()
	
	if prize is CranePrize:
		GlobalTracking.add_state(prize.prize_tracker_name)
		prize._obtained_prize()
		print("obtained prize: " + prize.prize_tracker_name)
