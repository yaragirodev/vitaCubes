extends Spatial

onready var light1 = $env/SpotLight2

func _ready():
	if OS.get_name() == "Vita":
		light1.shadow_enabled = false

