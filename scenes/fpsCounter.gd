extends Label3D

func _process(_delta):
	text = str(Engine.get_frames_per_second())
