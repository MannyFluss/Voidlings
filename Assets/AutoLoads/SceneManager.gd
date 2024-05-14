extends CanvasLayer

#no saving state
@onready
var myAnimationPlayer : AnimationPlayer = $AnimationPlayer


func _ready() -> void:
	myAnimationPlayer.play("RESET")
#
#
func changeSceneWithTransition(tscn : PackedScene, transition_type : String = "BoringTransition")->void:
	visible=true
	if myAnimationPlayer.has_animation(transition_type)==false:
		transition_type = "BoringTransition"
	myAnimationPlayer.play(transition_type)
	await myAnimationPlayer.animation_finished
	get_tree().change_scene_to_packed(tscn)
	if myAnimationPlayer.has_animation(transition_type+"2"):
		myAnimationPlayer.play(transition_type+"2")
	else:
		myAnimationPlayer.play_backwards(transition_type)
	await myAnimationPlayer.animation_finished
	visible=false
	
	
