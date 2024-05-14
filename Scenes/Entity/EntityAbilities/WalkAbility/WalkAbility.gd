extends CEntityAbility


func _physics_process(delta: float) -> void:
	if checkIfHasAuthority():
		print("i got the authority")
		count -= 1
		releaseInputAuthority()
