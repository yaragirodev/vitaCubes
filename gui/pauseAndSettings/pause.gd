extends Control

onready var resumeButton = $resumeButton
onready var settingsButton = $settingsButton
onready var exitButton = $exitButton

func _ready():
	resumeButton.connect("pressed", self, "_resumeGame")
	settingsButton.connect("pressed", self, "_openSettings")
	exitButton.connect("pressed", self, "_exitGame")

func _resumeGame():
	get_tree().paused = false
	visible = false
	globalData.isInPauseRn = false  
