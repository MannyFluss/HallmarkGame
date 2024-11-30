extends Node2D

const S_5_RE_POST_OFFICE = preload("res://scenes/act 1/s5-rePostOffice.dtl")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Dialogic.start(S_5_RE_POST_OFFICE)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
