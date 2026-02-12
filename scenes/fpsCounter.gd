extends Label3D

var fpsRightNow = 0
 
func _process(_delta):
	fpsRightNow = str(Engine.get_frames_per_second())
	text = fpsRightNow
	globalData.fps = fpsRightNow
