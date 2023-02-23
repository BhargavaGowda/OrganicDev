extends Spatial


func _ready():
	get_tree().call_group("SimElements","init")

	

func _physics_process(delta):
	
	get_tree().call_group("SimElements","preUpdate",delta)
	get_tree().call_group("SimElements","postUpdate",delta)
	
	
