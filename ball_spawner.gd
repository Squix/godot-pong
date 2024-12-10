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
		#Add ball to scene and apply a constant force toward the left of the screen
		current_scene.call_deferred("add_child", ball)
		#var direction = Vector2.RIGHT.rotated(randf_range(-PI / 4, PI / 4))
		#print("direction", direction)
		#ball.velocity = direction.normalized() * launch_speed
		#ball.move_and_slide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
