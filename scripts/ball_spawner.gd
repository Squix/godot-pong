extends Marker2D

@export var ball_scene : PackedScene
@export var launch_speed : float = 300.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	launch_ball()

func launch_ball() -> void:
	var ball : CharacterBody2D = ball_scene.instantiate()
	ball.position = global_position
	var current_scene = get_tree().get_current_scene()
	if current_scene:
		#Add ball to scene
		current_scene.call_deferred("add_child", ball)
