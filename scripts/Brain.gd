extends Spatial

var neurons = []
var eta = 0.1
var inpgem1
var inpgem2
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
	neurons[2].inps = [neurons[3]]
	neurons[2].inpWeights=[-2]
	neurons[3].inps = [neurons[4]]
	neurons[3].inpWeights=[0.5]
	neurons[4].inps = [neurons[0]]
	neurons[4].inpWeights=[0.5]
	
	inpgem1 = get_node("/root/Spatial/inpGem")
	inpgem2 = get_node("/root/Spatial/inpGem2")
	outgem = get_node("/root/Spatial/outGem")
	
func _physics_process(delta):
	if Input.is_action_pressed("ui_down"):
		neurons[0].input = 1
	if Input.is_action_pressed("ui_up"):
		neurons[0].input = -1
	
	
	
	neurons[1].error = neurons[1].a-2
	neurons[3].error = neurons[3].a+3
	print(neurons[1].a)
	print(neurons[3].a)


	for n in neurons:

		n.preBackUpdate()

		
	for n in neurons:
		n.postUpdate()
		
	outgem.val = 2*neurons[0].a
#	neurons[4].a = 5

	
	

