extends Spatial

var neurons = []
var eta = 0.1
var fc
var outgem
var maxAct = 3

func _ready():
	for child in self.get_children():
		neurons.append(child.N)
		child.N.eta = eta
		child.maxActivation = maxAct
		child.N.maxActivation = maxAct
	
	neurons[0].inps = [neurons[1]]
	neurons[0].inpWeights=[0.5]
	neurons[1].inps = [neurons[2]]
	neurons[1].inpWeights=[0.5]
	neurons[2].inps = [neurons[3],neurons[4]]
	neurons[2].inpWeights=[0.5,0.5]
	neurons[3].inps = [neurons[4]]
	neurons[3].inpWeights=[0.5]
	neurons[4].inps = [neurons[0]]
	neurons[4].inpWeights=[0.5]
	
	fc = get_node("/root/Spatial/Field Crystal")
	outgem = get_node("/root/Spatial/outGem")
	
func _physics_process(delta):
	
#	neurons[1].error = neurons[1].a-fc.global_translation.x
#	neurons[3].error = neurons[3].a-fc.global_translation.z
	
	print(neurons[1].error)
#	neurons[2].input = 2* outgem.pressureF
	if Input.is_action_pressed("ui_accept"):
		neurons[0].input = -2
	if Input.is_action_pressed("ui_select"):
		neurons[0].input = 2


	for n in neurons:
		n.preBackUpdate()
		
	for n in neurons:
		n.postUpdate()
		
	outgem.x = neurons[1].a
	outgem.z = neurons[3].a
#	neurons[4].a = 5

	
	

