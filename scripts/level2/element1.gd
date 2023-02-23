extends MeshInstance

var MAX = 3
var ETA = 0.1
var hover = 0
var error = 0
var ray

func init():
	ray = get_node("RayCast")
	print("ele1 ready")
	

func preUpdate(delta):
	error = ETA*error
	hover -= error
	error = 0
	hover = min(max(-MAX,hover),MAX)
	
func postUpdate(delta):
	global_translation.y = get_parent().global_translation.y + hover
	
	
