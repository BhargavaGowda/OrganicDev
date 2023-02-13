extends KinematicBody


#motors defined
var motor1 = 0
var motor2 = 0
var eye
var heart
var obstacle = false
var time
var seenPoint = Vector3()
var headingPoint = Vector3()

func _ready():
	eye = get_node("/root/Scene/Eye")
	heart = get_node("heart")


func _physics_process(delta):


	#gravity
	move_and_collide(Vector3(0,-9.8,0)*delta)


	#tell eye to get in front
	eye.checkPos = to_global(Vector3(0,0,5))
	
	if global_translation.distance_to(eye.global_translation)<5:
		eye.checkPos += to_global(Vector3(0,5,0))

	#get vision
	if heart.beat1==0:
		seenPoint = eye.see()
		
	#reset motors
	motor1 = 0
	motor2 = 0
	
	#follow point
	
	var dot = Vector3(0,0,1).dot(headingPoint)
	if abs(dot)>0.2:
		if seenPoint.x>0:
			motor1=1
			motor2=-1
		if seenPoint.x<0:
			motor2=1
			motor1=-1
	else:
		motor1=1
		motor2=1
		
	

	
	
	
	#motors acting
	rotate_y(0.5*motor1*delta)
	rotate_y(-0.5*motor2*delta)
	move_and_collide((global_transform.basis.z*motor1 + global_transform.basis.z*motor2)*delta)
	
	
	
	
	
	
	
	
	
