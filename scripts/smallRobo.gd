extends KinematicBody



func _physics_process(delta):
	
	#gravity
	move_and_collide(Vector3(0,-9.8,0)*delta)
	
	#motors defined
	var motor1vec = Vector3(0.5,0,1)
	var motor1 = 0
	var motor2vec = Vector3(-0.5,0,1)
	var motor2 = 0
	
	#motors acting
	var motorVec = motor1vec * motor1 + motor2vec * motor2
	look_at(self.to_global(motorVec),)
	move_and_collide(motorVec)
	
	
	
	
	
	
	
	
