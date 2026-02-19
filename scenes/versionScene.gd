extends Control

onready var backButton = $back

func _ready():
	backButton.connect('pressed', self, '_onBackButtonPressed')
	
func _onBackButtonPressed():
	get_tree().change_scene("res://scenes/MainMenu.tscn")
