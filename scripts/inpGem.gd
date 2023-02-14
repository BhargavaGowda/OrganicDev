extends MeshInstance

var val = 0
var rng = RandomNumberGenerator.new()
var time = 0
var f = 1
func _ready():
	rng.randomize()
	f = rng.randf()*5

func _physics_process(delta):
	time+=delta
#	val += 2*(rng.randf()-0.5)*delta
	val = sin(f*time)
	global_translation.y = 6 + val
