extends KinematicBody

var beat = 0
var robo
var checkPos = Vector3()
var hit = false


func _ready():
	robo = get_node("/root/Scene/smallRobo")

func _physics_process(delta):


	#local space point. eye wants to go here
	var target = Vector3()
		
	#home back to bot or explore
	if (checkPos-global_translation).length()>10:
		#home back
		target = to_local(robo.global_translation+robo.global_transform.basis.y*3)
	else:
		target = to_local(checkPos)

	
	#target seeking
	move_and_collide(global_transform.basis.z*delta*3)
		
	if target.x>0:
		rotate_object_local(Vector3(0,1,0),1*delta)
	else:
		rotate_object_local(Vector3(0,1,0),-1*delta)
		
	if target.y<0:
		rotate_object_local(Vector3(1,0,0),1*delta)
	else:
		rotate_object_local(Vector3(1,0,0),-1*delta)
		
	#spinny
	rotate_object_local(Vector3(0,0,1),0.4*delta)


		
			
func see():
	var space_state = get_world().direct_space_state
	var result = space_state.intersect_ray(global_translation, to_global(Vector3(0,0,5)), [self,robo])
	if result.empty():
		return global_translation
		hit = false
	else:
		#print(result.position)
		hit = true
		return result.position
		
	

