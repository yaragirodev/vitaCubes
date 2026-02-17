extends Control

onready var bSlider = $settingsHere/VBoxContainer/bouncinessSlider
onready var fSlider = $settingsHere/VBoxContainer/frictionSlider
onready var fovChanger = $settingsHere/VBoxContainer/fov_here
onready var backButton = $settingsHere/VBoxContainer/BACK
onready var gameGui = mainLvl.get_node("gui")

func _ready():
	# connecting connects
	bSlider.connect('value_changed', self, '_onBounceChanged')
	fSlider.connect('value_changed', self, '_onFrictionChanged')
	fovChanger.connect('value_changed', self, '_onFOVchanged')
	backButton.connect('pressed', self, '_onBackPressed')

func _onBounceChanged(value):
	Cube.physics_material_override.bounce = value
	print("all cubes changed bounciness to ", value)


func _onBackPressed():
	visible = false
	globalData.isInSettings = true
