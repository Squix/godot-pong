extends CharacterBody2D

@export var move_speed : float = 1000.0

@onready var raycast_up: RayCast2D = $RaycastUp
@onready var raycast_down: RayCast2D = $RaycastDown

@onready var origin_x: float = position.x

var direction = 1
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta: float) -> void:
	
	#ensure the opponent is never ejected
	velocity.x = 0
	position.x = origin_x
	
	#change direction when approaching the boundaries of the screen
	if raycast_up.is_colliding():
		direction = 1
	if raycast_down.is_colliding():
		direction = -1
	velocity.y = direction * move_speed

	move_and_slide()
