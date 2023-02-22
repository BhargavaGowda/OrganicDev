extends Spatial

func _physics_process(delta):
	get_tree().call_group("SimElements","preUpdate",delta)
	get_tree().call_group("SimElements","postUpdate",delta)
