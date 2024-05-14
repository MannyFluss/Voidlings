class_name CLevelSelectionButton extends Control

@export_file("*.tscn")
var levelToLoad : String

func _on_button_pressed() -> void:
	var sceneToGoTo : PackedScene = load(levelToLoad) as PackedScene
	#todo implement scene transitions
	SceneManager.changeSceneWithTransition(sceneToGoTo)
	
