extends AnimatableBody2D

@export var move_speed: float = 600.0
@onready var x_pos: float = global_position.x

var velocity: float = 0  # Declare velocity as a Vector2

# Handle input explicitly
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("move_up"):
		velocity = -move_speed
	elif event.is_action_pressed("move_down"):
		velocity = move_speed
	elif event.is_action_released("move_up") or event.is_action_released("move_down"):
		velocity = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:

	# Move and check collisions using move_and_collide
	var motion = Vector2(0, velocity * delta)
	var collision = move_and_collide(motion)

	if collision:
		# Stop movement if a collision is detected
		velocity = 0


	# Snap to pixel grid to prevent jittering
	#position.y = round(position.y)
