extends MeshInstance

var MAX = 3
var ETA = 0.001

var tau = 0
var speed = 1
var dist = 0.5
var energy = 5


func init():
	print("ele2 ready")

func preUpdate(delta):
	speed = min(max(speed,1),30)
	energy = max(energy,0)
	
	tau+=delta*speed
	
	var energyError = speed*dist - energy
	print(speed," ",dist," ",energyError)
	dist += -speed*energyError*ETA
	dist = min(max(dist,0.01),5)
	
	
	
	
func postUpdate(delta):
	
	global_translation = Vector3(dist*sin(tau),6,dist*cos(tau))
	
