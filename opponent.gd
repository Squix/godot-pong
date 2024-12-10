extends CharacterBody2D

@export var move_speed : float = 300.0

@onready var raycast_up: RayCast2D = $RaycastUp
@onready var raycast_down: RayCast2D = $RaycastDown

var direction = 1
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	
	#change direction when approaching the boundaries of the screen
	if raycast_up.is_colliding():
		direction = 1
	if raycast_down.is_colliding():
		direction = -1
	velocity.y = direction * move_speed

	move_and_slide()
