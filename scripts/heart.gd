extends MeshInstance

var robo
var time = 0
var fill = 1
var level = 0
var beat0=0
var beat1=0
var beat2=0
var baseColor
func _ready():
	robo = get_parent()
	baseColor = get_active_material(0).get_albedo()
	
func _physics_process(delta):
	
	time += fill
	if time>60:
		time = 60
		fill*=-1
	if time<0:
		time = 0
		fill*=-1
		
	level = time/60.0
	
	beat0 = time%60
	beat1 = time%30
	beat2 = time%20
		
	
	
	get_active_material(0).set_albedo(baseColor.darkened(0.5*level))

