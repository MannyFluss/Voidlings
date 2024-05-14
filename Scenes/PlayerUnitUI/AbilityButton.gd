class_name CAbilityButton extends Panel

static var myAbilityButton : PackedScene = preload("res://Scenes/PlayerUnitUI/AbilityButton.tscn")



static func AbilityButtonConstruct(ability : CEntityAbility)->CAbilityButton:
	var newAbilityButton : CAbilityButton = myAbilityButton.instantiate() as CAbilityButton
	ability.countChanged.connect(newAbilityButton.onAbilityCountChanged)
	newAbilityButton.initAbilitySet(ability)
	
	return newAbilityButton

@onready
var myCountShown : RichTextLabel = %CountShown as RichTextLabel

var myAbility : CEntityAbility

func initAbilitySet(ability : CEntityAbility)->void:
	myCountShown = %CountShown as RichTextLabel
	myCountShown.text = str(ability.count)
	myAbility = ability
	
func onAbilityCountChanged(value:int)->void:
	myCountShown.text = str(value)


func _on_button_pressed() -> void:
	myAbility.inputManager.giveInputAuthorityToAbility(myAbility)
	pass # Replace with function body.
