class_name CEntityAbility extends Node2D

enum SelectionState{
	UNSELECTED,
	PREVIEW,
	EXECUTING
}

signal stateChanged(state:SelectionState)

var myState : SelectionState = SelectionState.UNSELECTED:
	get:
		return myState
	set(value):
		if value!=myState:
			stateChanged.emit(value)
		myState = value

signal countChanged(value:int)

signal selected
signal deselected

@export
var count : int = 10:
	get:
		return count
	set(value):
		countChanged.emit(value)
		count = value

@onready
var inputManager : CInputManager = get_tree().get_first_node_in_group("CInputManager") as CInputManager

func _AbilitySelected()->void:
	pass
#todo make it so that doesnt need to be direct parent
func getMyEntity()->CEntity:
	return get_parent() as CEntity
	
func setInputAuthority()->void:
	inputManager.giveInputAuthorityToAbility(self)
	
func releaseInputAuthority()->void:
	inputManager.mySelectionState = inputManager.SelectionState.SELECTED
	
func checkIfHasAuthority()->bool:
	if inputManager.mySelectionState != inputManager.SelectionState.UNIT_REQUESTED_CONTROL:
		return false
	if getMyEntity() != inputManager.selectedEntity:
		return false
	return true
	 

