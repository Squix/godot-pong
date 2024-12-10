extends CharacterBody2D

@export var speed: float = 300.0

func _ready():
	# Initialize the ball's velocity in a random direction
	var direction = Vector2.RIGHT.rotated(randf_range(-PI / 4, PI / 4))
	velocity = direction.normalized() * speed

# custom physics to bounce on impact
func _physics_process(delta):
	# Move the ball and handle collisions
	var collision = move_and_collide(velocity * delta)
	if collision:
		# Reflect the velocity based on the collision normal
		velocity = velocity.bounce(collision.get_normal())
