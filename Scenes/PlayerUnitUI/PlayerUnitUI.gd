class_name CPlayerUnitUI extends Control



@onready
var myAbilitiesContainer : HBoxContainer = %AvailableAbilitiesContainer
@onready
var inputManager : CInputManager = get_tree().get_first_node_in_group("CInputManager") as CInputManager

func _enter_tree() -> void:
	add_to_group("CPlayerUnitUI")

func _ready() -> void:
	inputManager = get_tree().get_first_node_in_group("CInputManager") as CInputManager
	inputManager.entitySelected.connect(onEntitySelected)
	inputManager.entityDeselected.connect(onEntityDeselected)
# Called every frame. 'delta' is the elapsed time since the previous frame.

func resizeAnimation()->void:
	var myTween : Tween = get_tree().create_tween()
	myTween.tween_property(self,"size",myAbilitiesContainer.size,.4)

func setShownAbilities(abilities : Array[CEntityAbility])->void:
	clearAbilities()	
	for ability : CEntityAbility in abilities:
		if ability==null:
			continue
		myAbilitiesContainer.add_child(CAbilityButton.AbilityButtonConstruct(ability))

func clearAbilities()->void:
	for abilityIcon : Node in myAbilitiesContainer.get_children():
		abilityIcon.queue_free()

func onEntitySelected(entity:CEntity)->void:
	setShownAbilities(entity.myAbilities)
	
func onEntityDeselected(entity:CEntity)->void:
	#clearAbilities()
	pass
