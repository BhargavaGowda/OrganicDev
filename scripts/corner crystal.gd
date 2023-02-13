extends KinematicBody

var frozen = false
var locking = true
var heading = Vector3(0,0,0)
var rotx = 0

func _physics_process(delta):
	
	#if not frozen:
		#rotate_object_local(Vector3(0,1,0),rotx)
		#rotate_object_local(Vector3(1,0,0),1)


	
	#Rays
	var space_state = get_world().direct_space_state
	var down = space_state.intersect_ray(global_translation, to_global(Vector3(0,-2,0)), [self])
	var front = space_state.intersect_ray(global_translation, to_global(Vector3(0,0,2)), [self])
	var right = space_state.intersect_ray(global_translation, to_global(Vector3(-2,0,0)), [self])
	
	
	if not down.empty():
		heading+= Vector3(0,3*delta,0)
	if not front.empty():
		heading+= Vector3(-2*delta,0,-3*delta)
		
	heading+= Vector3(0,-1*delta,1*delta)
	

	#limit speed
	if heading.length()>10:
		heading = heading.normalized()*10
	if rotx>PI*delta:
		rotx=PI*delta
	rotx=rotx*0.99
	
	#print(down.empty(),front.empty(),right.empty())
	if (not down.empty()) and (not front.empty()) and (not right.empty()):
		frozen=true
	
	#locking override
	if locking == false:
		frozen = false
		
	#moving
	if not frozen:
		move_and_collide((to_global(heading)-global_translation) *delta)
	
	
	
	
