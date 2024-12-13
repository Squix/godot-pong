extends AnimatableBody2D

@export var move_speed: float = 600.0
@onready var x_pos: float = global_position.x

var velocity: Vector2 = Vector2.ZERO  # Declare velocity as a Vector2

# Handle input explicitly
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("move_up"):
		velocity.y = -move_speed
	elif event.is_action_pressed("move_down"):
		velocity.y = move_speed
	elif event.is_action_released("move_up") or event.is_action_released("move_down"):
		velocity.y = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:

	# Apply movement manually for AnimatableBody2D
	position += velocity * delta

	# Snap to pixel grid to prevent jittering
	#position.y = round(position.y)
