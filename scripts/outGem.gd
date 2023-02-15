extends MeshInstance

var x = 0
var z = 0

func _physics_process(delta):
	global_translation.z = z
	global_translation.x = x
	
