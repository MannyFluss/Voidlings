class_name CVoidling extends CEntity

@onready
var myNavAgent : NavigationAgent2D = %NavigationAgent2D
# Called when the node enters the scene tree for the first time.

func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _physics_process(delta:float)->void:
	if myNavAgent.is_navigation_finished():
		return
	var current_agent_position: Vector2 = global_position
	var next_path_position: Vector2 = myNavAgent.get_next_path_position()
	velocity = current_agent_position.direction_to(next_path_position) * 100
	move_and_slide()
	
