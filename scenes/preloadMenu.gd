extends Control

onready var preloadButton: Button = $CanvasLayer/Panel/loadButton
onready var proceedButton: Button = $CanvasLayer/Panel/proceed
onready var littletext: Label = $CanvasLayer/Panel/littleWarning

func _ready():
	preloadButton.connect("pressed", self, "_onLoadButtonClicked")
	proceedButton.connect("pressed", self, "_onProceedButtonClicked")
	proceedButton.visible = false
	
func _onLoadButtonClicked():
	# load main scene
	var scene = load("res://scenes/main.tscn")
	var instance = scene.instance()
	get_node("PRELOADHERE").add_child(instance)
	print("Loaded main.tscn scene !")
	
	if OS.get_name() == "Vita":
		Engine.physics_ticks_per_second = 30
	
	# load cube
	var cube = load("res://assets/cube/cube.tscn")
	var Cubeinstance = cube.instance()
	print("Loaded cube.tscn !")
	
	get_node("PRELOADHERE").add_child(Cubeinstance)
	
	print("Scene preloaded!")
	proceedButton.visible = true
	preloadButton.visible = false
	littletext.text = "assets loaded, you can play!"

func _onProceedButtonClicked():
	get_tree().change_scene("res://scenes/MainMenu.tscn")
