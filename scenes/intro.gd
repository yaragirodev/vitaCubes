extends Control


func _ready():
	$Timer.start()
	yield($Timer, "timeout")
	get_tree().change_scene("res://scenes/MainMenu.tscn")
