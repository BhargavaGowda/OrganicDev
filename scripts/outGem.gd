extends MeshInstance

var val = 0

func _physics_process(delta):
	global_translation.y += 0.01*val
