extends Control

onready var spawnButton = $spawnCubeButton
onready var deleteButton = $deleteAllButton
onready var spawned_spatial = mainLvl.get_node("spawnedStuff")
onready var cubesCount: Label = $CubesCount

var boxScene = preload("res://assets/cube/cube.tscn")

func _ready():
	spawnButton.connect("pressed", self, "_onSpawnButtonPressed")
	deleteButton.connect("pressed", self, "_onDeleteButtonPressed")
	
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
	


