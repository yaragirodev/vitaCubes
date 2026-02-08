extends Control

onready var preloadButton: Button = $CanvasLayer/Panel/loadButton
onready var proceedButton: Button = $CanvasLayer/Panel/proceed
onready var littletext: Label = $CanvasLayer/Panel/littleWarning

func _ready():
	preloadButton.connect("pressed", self, "_onLoadButtonClicked")
	proceedButton.connect("pressed", self, "_onProceedButtonClicked")
	proceedButton.visible = false
	
func _onLoadButtonClicked():
	var scene = load("res://scenes/main.tscn")
	var instance = scene.instance()
	get_node("PRELOADHERE").add_child(instance)
	print("Scene preloaded!")
	proceedButton.visible = true
	preloadButton.visible = false
	littletext.text = "assets loaded, you can play!"

func _onProceedButtonClicked():
	get_tree().change_scene("res://scenes/main.tscn")
