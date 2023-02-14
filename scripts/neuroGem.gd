extends MeshInstance
const DNeuron = preload("DistroNeurons.gd")

var N = DNeuron.new()
var col = Color(0,0,0)

var maxActivation = 3

func _ready():
	set_surface_material(0,get_active_material(0).duplicate())
	

func _physics_process(delta):
	if N.a>0:
		col = Color(0,min(N.a/maxActivation,maxActivation),0)
	else:
		col = Color(min(-1*N.a/maxActivation,maxActivation),0,0)
#	print(N.a)
	get_active_material(0).set_albedo(col)
	
