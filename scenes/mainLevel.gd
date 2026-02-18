extends Spatial

onready var light1 = $env/OmniLight
onready var spawned_spatial = get_node("spawnedStuff")
var isVita = false
var OnPC = false

func _ready():
	# is this vita?
	isVita = OS.get_name() == "Vita"
	OnPC = OS.get_name() == "Windows"
	# no shadows on vita (its bugged)
	if OS.get_name() == "Vita":
		light1.shadow_enabled = false
		
	globalData.mainScene = self

# i think this will help vita players
func _process(delta):
	if isVita and globalData.cubesTotal >= 100:
		# OH NO 100 CUBES!
		globalData.cubesTotal = 0
		# delete all cubes ):
		for child in spawned_spatial.get_children():
			child.queue_free()
			
	if Engine.get_frames_per_second() <= 20:
		for child in spawned_spatial.get_children():
			child.queue_free()
