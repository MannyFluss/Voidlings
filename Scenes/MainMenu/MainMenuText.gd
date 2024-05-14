class_name CTypingTextEdit extends TextEdit


# Called when the node enters the scene tree for the first time.

var textToBeTyped:String = ""

func _ready() -> void:
	focus_entered.connect(_on_focus_entered)
	textToBeTyped = text
	text = ""
	typeText()

func typeText()->void:
	if textToBeTyped.is_empty():
		return
	text += textToBeTyped[0]
	
	textToBeTyped = textToBeTyped.erase(0,1)
	await get_tree().create_timer(randf_range(0.1,0.2)).timeout
	typeText()
	
	
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_focus_entered()->void:
	pass
