extends MeshInstance


var outGem
var presence = 0
var presenceF = 0
var senseRange = 3.0
var col

func _ready():
	set_surface_material(0,get_active_material(0).duplicate())
	outGem = get_node("/root/Spatial/outGem")
	col = get_active_material(0).get_albedo()
#	print(col.h)
	
func _physics_process(delta):
	
	var approachDist = global_translation.distance_to(outGem.global_translation)
	
	if approachDist < senseRange:
		presence = (senseRange-approachDist)/senseRange
	else:
		presence = 0
		
	if Input.is_action_pressed("ui_down"):
		global_translation.z-=2*delta
	if Input.is_action_pressed("ui_up"):
		global_translation.z+=2*delta
	if Input.is_action_pressed("ui_left"):
		global_translation.x+=2*delta
	if Input.is_action_pressed("ui_right"):
		global_translation.x-=2*delta
		
		
	
	
	col.h = 0.778431
	col.s = max(min(presence,1),0)
	col.v = max(min(presence,1),0.2)
	get_active_material(0).set_albedo(col)
	presenceF = presence
	
