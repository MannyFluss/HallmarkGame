extends Node2D

@onready var letter_to_scroll: Node2D = $LetterToScroll


var tween : Tween = null

func _on_button_pressed() -> void:
	if tween and tween.is_running():
		return
	tween = get_tree().create_tween()
	
	tween.tween_property(letter_to_scroll,"position",letter_to_scroll.position + Vector2(0,-300),1.7).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_CUBIC)
	pass # Replace with function body.


func _on_submit_button_pressed() -> void:
	
	pass # Replace with function body.
