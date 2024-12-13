extends CharacterBody2D

@export var move_speed : float = 600.0

@onready var raycast_up: RayCast2D = $RaycastUp
@onready var raycast_down: RayCast2D = $RaycastDown
@onready var opponent_ai_mode_debug_label: Label = $"../OpponentAImodeDebugLabel"
@onready var active_behavior_trigger_x : float = $"../OpponentAIActiveBehaviorTrigger".global_position.x


@onready var origin_x: float = position.x
@onready var origin_y: float = position.y

enum behavior_mode {active, idle} #AI modes

var behavior : behavior_mode = behavior_mode.idle

#Handle idle AI mode
func idle_behavior():
	#Move towards the origin Y if not already here and stop when reaching it
	if position.y != origin_y:
		var direction = sign(origin_y - position.y)
		velocity.y = direction * move_speed
	else:
		velocity.y = 0
		#position.y = round(position.y)

#Handle active behavior
func active_behavior(ball_x : float, ball_y : float):
	#Follow the ball Y position
	if abs(position.y - ball_y) > 1:
		var direction = sign(ball_y - position.y)
		velocity.y = direction * move_speed
	else:
		velocity.y = 0  # Stop when aligned with the ball

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta: float) -> void:
	
	var ball = get_node_or_null("../Ball")

	if ball:
		# Determine behavior state based on ball position
		# Change to active only if not already active
		if ball.global_position.x >= active_behavior_trigger_x and behavior != behavior_mode.active:
			behavior = behavior_mode.active
			opponent_ai_mode_debug_label.text = "active"
		elif ball.global_position.x < active_behavior_trigger_x and behavior != behavior_mode.idle:
			behavior = behavior_mode.idle
			opponent_ai_mode_debug_label.text = "idle"
	
	#when ball is reset, go to idle mode
	else:
		behavior = behavior_mode.idle
		opponent_ai_mode_debug_label.text = "idle"
	
	# Execute behavior based on current mode
	match behavior:
		behavior_mode.idle:
			idle_behavior()
		behavior_mode.active:
			if ball:
				active_behavior(ball.global_position.x, ball.global_position.y)
	
	# Prevent movement in the x-direction
	velocity.x = 0
	position.x = origin_x
	
	
	##change direction when approaching the boundaries of the screen
	#if raycast_up.is_colliding():
		#direction = 1
	#if raycast_down.is_colliding():
		#direction = -1
	#velocity.y = direction * move_speed

	move_and_slide()
