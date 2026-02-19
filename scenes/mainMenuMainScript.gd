extends Control

onready var splashLabel: Label = $splash
onready var playButton: Button = $Play
onready var exitButton: Button = $Exit
onready var versionLabel = $version

func _ready():
	#button connects
	playButton.connect('pressed', self, '_onPlayPressed')
	exitButton.connect('pressed', self, '_onExitPressed')
	versionLabel.connect('pressed', self, '_goToVersionScene')
	
	# version set
	if OS.get_name() == "Vita":
		versionLabel.text = 'vita-' + str(globalData.current_ver)
		
	if OS.get_name() == "Windows":
		versionLabel.text = 'win-' + str(globalData.current_ver)
		
	if OS.get_name() == "Linux":
		versionLabel.text = 'linux-' + str(globalData.current_ver)
	
	# set splash
	getAndSetRandomSplash()

func getAndSetRandomSplash():
	# random splashes!
	randomize()
	var randomIndex = randi() % globalData.splashes.size()
	var finalSplashText = globalData.splashes[randomIndex]
	splashLabel.text = finalSplashText
	
# main buttons
func _onPlayPressed():
	print("playbutton pressed")
	get_tree().change_scene("res://scenes/main.tscn")
	
func _onExitPressed():
	print("BYE")
	get_tree().quit()
	
func _goToVersionScene():
	get_tree().change_scene("res://scenes/versionScene.tscn")

