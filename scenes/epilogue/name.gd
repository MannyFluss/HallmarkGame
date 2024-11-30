extends RichTextLabel


# Called when the node enters the scene tree for the first time.
func _ready():
	text = "My dear "+GlobalTracking.tracking_variables["your_first_name"]+","


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
