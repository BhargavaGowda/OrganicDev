extends MeshInstance

var x = 0
var z = 0
var pressure = 0
var pressureF = 0
var col
var fieldCrystal

func _ready():
	col = get_active_material(0).get_albedo()
	fieldCrystal = get_node("/root/Spatial/Field Crystal")
#	print(col.h)
	

func _physics_process(delta):
	global_translation.z = z
	global_translation.x = x
	
	pressure = fieldCrystal.presenceF
	
	pressure*=0.9
	pressureF = pressure
	
	
	var col = get_active_material(0).get_albedo()
	col.h =0.16
	col.s = max(min(pressure,1),0)
	col.v = max(min(pressure,1),0.8)
	
	get_active_material(0).set_albedo(col)
	
