extends Spatial

var t = 0
var ele1
var ele1a
var ele2

func init():
	ele1 = get_node("element1")
	ele1a = get_node("element1a")
	ele2 = get_node("element2")


func preUpdate(delta):
	t+=delta
	
func postUpdate(delta):

	ele2.speed = 5*abs(ele1.hover)
	ele2.energy += delta*ele1a.hover
	ele1.error = ele1.hover + 4*ele2.dist
	ele1a.error = ele1a.hover - 2*ele1.hover
	
	if(Input.is_action_pressed("ui_accept")):
		ele1a.error += 1
	
