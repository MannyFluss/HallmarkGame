extends Node2D

@onready var attempts_text: RichTextLabel = $"Attempts Text"

func _on_crane_unclamped(times: int) -> void:

	attempts_text.text = "Attempts Left: " + str(3 - times)
	if times == 3:
		game_over()




func game_over()->void:
	await get_tree().create_timer(1.0).timeout
	SceneSwitcher.SwitchScene("res://scenes/Act1.3/Act1_3.tscn")
	pass
