extends Node2D


# Called when the node enters the scene tree for the first time.
@onready var santa_bad: Sprite2D = %SantaBad
@onready var bad_song: AudioStreamPlayer = %BadSong
@onready var letter_parts: CPUParticles2D = $BadEnding/LetterParts

var santa_speed = .01
var bad = false

func _ready() -> void:
	bad_ending()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if bad:
		santa_bad.scale += Vector2(santa_speed*delta,santa_speed*delta)
	pass


func bad_ending()->void:
	bad = true
	bad_song.play()
	await get_tree().create_timer(3.5).timeout
	letter_parts.emitting = true
	pass
