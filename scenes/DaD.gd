extends Camera

# !THIS SCRIPT IS AI-GENERATED!

var dragged_object: RigidBody = null
var drag_distance = 0.0
var grab_offset = Vector3()
var is_dragging = false


export var stiffness = 5.0
export var damping = 1.2

func _input(event):
	if event is InputEventMouseButton and event.button_index == 1:
		if event.pressed:
			grab(event.position)
		else:
			release()
	
	if event is InputEventMouseMotion and is_dragging:
		update_target(event.position)

func _physics_process(delta):
	if not is_dragging or dragged_object == null:
		return
	
	var target = get_target_position()
	
	var current = dragged_object.global_transform.origin
	
	var force = (target - current) * stiffness
	
	force -= dragged_object.linear_velocity * damping
	
	dragged_object.add_central_force(force)

func grab(screen_pos):
	var from = project_ray_origin(screen_pos)
	var to = from + project_ray_normal(screen_pos) * 100
	
	var result = get_world().direct_space_state.intersect_ray(from, to)
	
	if result and result.collider is RigidBody:
		dragged_object = result.collider
		drag_distance = global_transform.origin.distance_to(result.position)
		is_dragging = true

func release():
	dragged_object = null
	is_dragging = false

func update_target(screen_pos):
	drag_distance = drag_distance

func get_target_position() -> Vector3:
	var screen_pos = get_viewport().get_mouse_position()
	var from = project_ray_origin(screen_pos)
	var direction = project_ray_normal(screen_pos)
	return from + direction * drag_distance
