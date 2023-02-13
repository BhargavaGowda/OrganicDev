extends KinematicBody

const Neuron = preload("Neurons.gd")
var rng = RandomNumberGenerator.new()

var inps = [0,0,0]
var first = []
var hidden = []
var outs = []
var time = 0
var supervision = [0,0,0]
var netOut = [0,0,0]


	

func _ready():
	rng.randomize()
	for i in range(3):
		first.append(Neuron.new())
		hidden.append(Neuron.new())
	for i in range(3):
		outs.append(Neuron.new())
		
	for i in range(len(outs)):
		for j in range(len(hidden)):
			outs[i].inps.append(hidden[j])
			outs[i].inpWeights.append(rng.randf()-0.5)
			
	for i in range(len(hidden)):
		for j in range(len(first)):
			hidden[i].inps.append(first[j])
			hidden[i].inpWeights.append(rng.randf()-0.5)
		
	
func _physics_process(delta):
	supervision = [0,0,0]
	time+=1
	inps =[10,10,10]
	var space_state = get_world().direct_space_state
	var ray1 = space_state.intersect_ray(global_translation, to_global(Vector3(-1,0,10)), [self])
	var ray2 = space_state.intersect_ray(global_translation, to_global(Vector3(0,0,10)), [self])
	var ray3 = space_state.intersect_ray(global_translation, to_global(Vector3(1,0,10)), [self])
	
	if ray1:
		inps[0] = global_translation.distance_to(ray1.position)
	if ray2:
		inps[1] = global_translation.distance_to(ray2.position)
	if ray3:
		inps[2] = global_translation.distance_to(ray3.position)
	#print(inps)
	
	netOut = runNetwork()
	#decayNet()
	
	rotate_y(netOut[2]*delta)
	move_and_collide(global_transform.basis.z*delta*netOut[0])
	move_and_collide(global_transform.basis.y*delta*-9.8)
	
	if Input.is_action_pressed("ui_down"):
		supervision[0]=-2
	if Input.is_action_pressed("ui_up"):
		supervision[0]=5
	if Input.is_action_pressed("ui_left"):
		supervision[2]=1
	if Input.is_action_pressed("ui_right"):
		supervision[2]=-1
		
	supervision = [inps[1]-3,0,0]
	if abs(inps[0]+inps[2])<8:
			supervision[2]= 100*(inps[2]-inps[0])
	else:
		supervision[2] =3*(inps[2]-inps[0])
		

	print(supervision)
	if Input.is_action_pressed("ui_accept"):
		for i in range(len(supervision)):
			outs[i].backprop(netOut[i]-supervision[i])
		
	
	
	
#	print(outs[0].inpWeights)
	
func runNetwork():
	for i in range(len(inps)):
		first[i].a = inps[i]
	var out = []
	for i in range(len(outs)):
		out.append(outs[i].forward())
	return out
	
func decayNet():
	for i in range(len(hidden)):
		hidden[i].decayWeights()
	for i in range(len(outs)):
		outs[i].decayWeights()
	
	
