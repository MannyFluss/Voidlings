extends Control


@onready
var myLevelSelect : Button = %LevelSelect
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	myLevelSelect.pressed.connect(on_LevelSelect_pressed)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func on_LevelSelect_pressed()->void:
	var loadMenu : PackedScene = load("res://Scenes/MainMenu/LevelSelectionMenu/LevelSelection.tscn") as PackedScene
	var instance : Node = loadMenu.instantiate() as Node
	
	get_tree().current_scene.add_child(instance)
