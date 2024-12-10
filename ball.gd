extends CharacterBody2D

@export var speed: float = 300.0
@export var player_bounce_speed_multiplier = 1.1 # apply this multiplier to the speed of the ball when bouncing on player

func _ready():
	# Initialize the ball's velocity in a random direction
	var direction = Vector2.RIGHT.rotated(randf_range(-PI / 4, PI / 4))
	velocity = direction.normalized() * speed

# custom physics to bounce on impact
func _physics_process(delta):
	# Move the ball and handle collisions
	var collision = move_and_collide(velocity * delta)
	if collision:
		var bounce_speed_multiplier = 1 # no multiplier if the ball is bouncing on the walls
		if collision.get_collider().is_in_group("Player"):
			bounce_speed_multiplier = player_bounce_speed_multiplier
			
		# Reflect the velocity based on the collision normal
		velocity = velocity.bounce(collision.get_normal()) * bounce_speed_multiplier
