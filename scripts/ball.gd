extends CharacterBody2D

@export var speed: float = 300.0
@export var max_speed : float = 400.0
@export var player_bounce_speed_multiplier = 1.25 # apply this multiplier to the speed of the ball when bouncing on player

func _ready():
	# Initialize the ball's velocity in a random direction
	var side = Vector2.LEFT
	#if randi_range(0,1):
		#side = Vector2.RIGHT
	var direction = side.rotated(randf_range(-PI / 4, PI / 4))
	velocity = direction.normalized() * speed

# custom physics to bounce on impact
func _physics_process(delta):
	# Move the ball and handle collisions
	var collision = move_and_collide(velocity * delta)
	if collision:
		var bounce_speed_multiplier = 1 # no multiplier if the ball is bouncing on the walls or if max speed is reached
		if collision.get_collider().is_in_group("Player") and speed < max_speed:
			bounce_speed_multiplier = player_bounce_speed_multiplier
			
		# Reflect the velocity based on the collision normal
		velocity = velocity.bounce(collision.get_normal()) * bounce_speed_multiplier
		speed = abs(velocity.y)
