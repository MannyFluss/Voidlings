class_name CEntity extends CharacterBody2D

@export
var myAbilities : Array[CEntityAbility]

@onready
var playerAbilityUI : CPlayerUnitUI = get_tree().get_first_node_in_group("CPlayerUnitUI") as CPlayerUnitUI

signal selected
signal deselcted

func _enter_tree() -> void:
	selected.connect(on_selected)
	deselcted.connect(on_deselected)
	
#todo preview abilities
func on_selected()->void:
	#playerAbilityUI.setShownAbilities(myAbilities)
	pass
#todo clear abilities
func on_deselected()->void:
	#playerAbilityUI.clearAbilities()
	pass
	
func _inputFromPlayerManager(_input : InputEvent)->void:
	pass
