class_name CInputManager extends Node2D

signal clickJustPressed(position:Vector2)
signal clickPressed(position:Vector2)
signal clickReleased(position:Vector2)

signal entitySelected(entity:CEntity)
signal entityDeselected(entity:CEntity)


var cursorPosition : Vector2 = Vector2.ZERO

var selectedEntity : CEntity = null : 
	get: 
		return selectedEntity
	set(entity):
		if entity==selectedEntity:
			return
		if entity==null :
			if selectedEntity!=null: 
				entityDeselected.emit(selectedEntity)
				selectedEntity.deselcted.emit()
			selectedEntity=null
			return
		if entity:
			if selectedEntity!=null:
				entityDeselected.emit(selectedEntity)
				selectedEntity.deselcted.emit()
			selectedEntity = entity
			entitySelected.emit(selectedEntity)
			selectedEntity.selected.emit()
			return

enum SelectionState {
	UNSELECTED,
	SELECTED,
	UNIT_REQUESTED_CONTROL
}

var mySelectionState : SelectionState = SelectionState.UNSELECTED:

func _enter_tree() -> void:
	add_to_group("CInputManager")

func _process(delta: float) -> void:
	cursorPosition = get_global_mouse_position()
	
func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("c_click"):
		clickJustPressed.emit(cursorPosition)
		select(event)
	if Input.is_action_pressed("c_click"):
		clickPressed.emit(cursorPosition)
	if Input.is_action_just_released("c_click"):
		clickReleased.emit(cursorPosition)

func select(event: InputEvent)->void:
	match (mySelectionState):
		SelectionState.UNSELECTED:
			attemptSelection()
		SelectionState.SELECTED:
			attemptSelection()
		SelectionState.UNIT_REQUESTED_CONTROL:
			pass

func attemptSelection()->void:
		var space_state : PhysicsDirectSpaceState2D = get_world_2d().direct_space_state
		var query := PhysicsRayQueryParameters2D.create(cursorPosition+Vector2(12.5,12.5), Vector2(-25, -25))
		queue_redraw()
		var result : Dictionary = space_state.intersect_ray(query)
		if result.has("collider"):
			selectedEntity = result["collider"]
			mySelectionState = SelectionState.SELECTED
		else:
			selectedEntity = null
			mySelectionState = SelectionState.UNSELECTED
			

func giveInputAuthorityToAbility(ability:CEntityAbility)->void:
	ability.selected.emit()
	mySelectionState = SelectionState.UNIT_REQUESTED_CONTROL

func retakeInputAuthority(ability:CEntityAbility)->void:
	ability.deselected.emit()
	mySelectionState = SelectionState.SELECTED
