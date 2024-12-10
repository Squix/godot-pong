extends CharacterBody2D

@export var move_speed : float = 300.0
@export var bounce_strength : float = 500.0
@onready var x_pos = global_position.x

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	
	velocity.y = 0  # Reset vertical velocity each frame to have constant speed
	global_position.x = x_pos # Reset x_pos each frame to prevent the ball to move the paddle
	
	#Move the character up or down
	if Input.is_action_pressed("move_up"):
		velocity.y = -move_speed
	elif Input.is_action_pressed("move_down"):
		velocity.y = move_speed
	
	#move_and_slide()
	
	# Move the character and detect collisions
	var collision = move_and_collide(velocity * delta)
	if collision:
		handle_collision(collision)

func handle_collision(collision: KinematicCollision2D) -> void:
	var collider = collision.get_collider()
	if collider.is_in_group("Balls"):
		# Calculate bounce direction
		var normal = collision.get_normal()
		print("normal", normal)
		#apply reverse force
		 # Calculate and apply the impulse for the bounce
		var bounce_impulse = -normal * bounce_strength
		print("bounce impulse", bounce_impulse)
		collider.apply_impulse(bounce_impulse, Vector2.ZERO)  # Apply impulse at the center
		
