class_name ObjectivePopup extends Control

@onready
var myAcceptTaskButton : Button = %AcceptTaskButton
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	myAcceptTaskButton.pressed.connect(on_acceptButton_pressed)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func on_acceptButton_pressed()->void:
	animateMe()

func animateMe()->void:
	myAcceptTaskButton.visible=false
	var myTween : Tween = get_tree().create_tween()
	var targetSize : Vector2 = size * 0.8
	var targetPosition : Vector2 = Vector2(get_window().size.x - targetSize.x, 0)
	myTween.set_parallel(true)
	myTween.tween_property(self,"position",targetPosition,1.5).set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_QUART)
	myTween.tween_property(self,"size",targetSize,1.0)
	
