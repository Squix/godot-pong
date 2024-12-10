extends CharacterBody2D

@export var move_speed : float = 300.0
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
	
	move_and_slide()
