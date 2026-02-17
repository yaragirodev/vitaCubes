extends Control

# gui controls
onready var spawnButton = $spawnCubeButton
onready var deleteButton = $deleteAllButton
onready var musicButton = $MusicButton
onready var changeCam = $changeCamera
onready var cubesCount: Label = $CubesCount
onready var versionLabel: Label = $version
onready var slowMoButton: Button = $slowMo
onready var settingsButton: Button = $openSettings

# other
onready var other_camera: Camera = mainLvl.get_node("pCam2")
onready var main_camera: Camera = mainLvl.get_node("pCam")
onready var spawned_spatial = mainLvl.get_node("spawnedStuff")
onready var musicPlayer = mainLvl.get_node("musicStream")
export (NodePath) var path_to_settings
onready var gameSettings = get_node(path_to_settings)

var boxScene = preload("res://assets/cube/cube.tscn")

func _ready():
	# connecting all stuff here
	spawnButton.connect("pressed", self, "_onSpawnButtonPressed")
	deleteButton.connect("pressed", self, "_onDeleteButtonPressed")
	musicButton.connect("pressed", self, "_onMusicButtonPressed")
	changeCam.connect("pressed", self, "_onChangeButtonButtonPressed")
	slowMoButton.connect("pressed", self, "_onSlowMoButtonPressed")
	settingsButton.connect('pressed', self, '_openSettings')
	
	# version text
	if OS.get_name() == "Vita":
		versionLabel.text = "vita-" + str(globalData.current_ver )
		
	elif OS.get_name() == "Windows":
		versionLabel.text = "win-" + str(globalData.current_ver )

# cubes counter
func _process(delta):
	cubesCount.text = str(globalData.cubesTotal)
	
func _onSpawnButtonPressed():
	print("Spawn button clicked!")
	spawnCube()
	addOneToGlobalCount()
	
func _onDeleteButtonPressed():
	print("Delete button clicked!")
	globalData.cubesTotal = 0
	for child in spawned_spatial.get_children():
		child.queue_free()

# function to spawn cube
func spawnCube():
	var box = boxScene.instance()
	box.translation = Vector3(0, 6.805, 0)
	spawned_spatial.add_child(box)

func addOneToGlobalCount():
	globalData.cubesTotal += 1
	

func _onMusicButtonPressed():
	if globalData.isMusicPlaying == false:
		musicPlayer.play()
		globalData.isMusicPlaying = true
		musicButton.text = "Music ON"
		
	else:
		musicPlayer.stop()
		globalData.isMusicPlaying = false
		musicButton.text = "Music OFF"
		
func _onChangeButtonButtonPressed():
	if globalData.isInOtherCamera == false:
		main_camera.current = false
		other_camera.current = true
		globalData.isInOtherCamera = true
		
	else:
		main_camera.current = true
		other_camera.current = false
		globalData.isInOtherCamera = false
		
func _onSlowMoButtonPressed():
	if globalData.isSlowMoEnabled == false:
		globalData.isSlowMoEnabled = true
		Engine.time_scale = 0.2
		
	else:
		globalData.isSlowMoEnabled = false
		Engine.time_scale = 1.0

func _openSettings():
	print("opening...")
	visible = false
	print("vanished")
	globalData.isInSettings = true
	gameSettings.visible = true
