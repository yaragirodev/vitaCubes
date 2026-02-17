extends Spatial

onready var light1 = $env/SpotLight2
onready var spawned_spatial = get_node("spawnedStuff")
var isVita = false

func _ready():
	# is this vita?
	isVita = OS.get_name() == "Vita"
	# no shadows on vita (its bugged)
	if OS.get_name() == "Vita":
		light1.shadow_enabled = false
		
func openPause():
	var pauseMenu = $CanvasLayer/pause
	
	if globalData.isInPauseRn == false:
		pauseMenu.visible = true
		get_tree().paused = true
		globalData.isInPauseRn = true
		
	else:
		pauseMenu.visible = false
		get_tree().paused = false
		globalData.isInPauseRn = false

# i think this will help vita players
func _process(delta):
	if isVita and globalData.cubesTotal >= 100:
		# OH NO 100 CUBES!
		globalData.cubesTotal = 0
		# delete all cubes ):
		for child in spawned_spatial.get_children():
			child.queue_free()
			
	if Input.is_action_just_pressed("pause"):
		openPause()
