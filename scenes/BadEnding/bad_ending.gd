extends Node2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

@onready var audio_stream_player_4: AudioStreamPlayer = $AudioStreamPlayer4


func _ready() -> void:
	
	fuck()


func fuck():
	while true:
		await get_tree().create_timer(1).timeout
		var new = animated_sprite_2d.duplicate()
		get_tree().current_scene.add_child(new)
		var new2 = audio_stream_player_4.duplicate()
		get_tree().current_scene.add_child(new2) 
		new2.play(.2)
		new.position = Vector2(randf_range(0,1920),randf_range(0,1080))
		
		
