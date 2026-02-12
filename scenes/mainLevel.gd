extends Spatial

onready var light1 = $env/SpotLight2
onready var spawned_spatial = get_node("spawnedStuff")

func _ready():
	if OS.get_name() == "Vita":
		light1.shadow_enabled = false
		

# i think this will help vita players
func _process(delta):
	# if player on vita
	if OS.get_name() == "Vita":
		if globalData.cubesTotal >= 100:
			# OH NO 100 CUBES!
			globalData.cubesTotal = 0
			# delete all cubes ):
			for child in spawned_spatial.get_children():
				child.queue_free()
