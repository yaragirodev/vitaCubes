extends Area

func _on_Area_body_entered(body):
	print("i found ", body)
	if "Cube" in body.name or "cube" in body.name:
		body.queue_free()
		print("Cube deleted!")
