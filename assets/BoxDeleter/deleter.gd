extends Area

func _on_Area_body_entered(body):
	print("i found ", body)
	if "RigidBody" in body.name or "cube" in body.name:
		body.queue_free()
		print("Cube deleted!")
		globalData.cubesTotal -= 1
		print("cube subtracted")
