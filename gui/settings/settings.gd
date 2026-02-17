extends Control

onready var bSlider = $settingsHere/VBoxContainer/bouncinessSlider
onready var fSlider = $settingsHere/VBoxContainer/frictionSlider
onready var fovChanger = $settingsHere/VBoxContainer/fov_here
onready var backButton = $settingsHere/VBoxContainer/BACK
export (NodePath) var guiPath
onready var gui_node = get_node(guiPath)

func _ready():
	# connecting connects
	bSlider.connect('value_changed', self, '_onBounceChanged')
	fSlider.connect('value_changed', self, '_onFrictionChanged')
	fovChanger.connect('value_changed', self, '_onFOVchanged')
	backButton.connect('pressed', self, '_onBackPressed')

func _onBounceChanged(value):
	Cube.physics_material_override.bounce = value
	print("all cubes changed bounciness to ", value)
	
func _onFOVchanged(value):
	var cam = get_viewport().get_camera()
	cam.fov = value

func _onFrictionChanged(value):
	Cube.physics_material_override.friction = value
	print("all cubes changed friction to ", value)

func _onBackPressed():
	visible = false
	# 1st getparent - canvasLayer; 2nd - spatial (main spatial)
	gui_node.visible = true
	globalData.isInSettings = false
	

