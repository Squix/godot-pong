extends Node

var player_score = 0
var opponent_score = 0

@onready var ball_spawner: Marker2D = %BallSpawner

# Update scores
func add_point(target: String):
	if target == "player":
		player_score += 1
	elif target == "opponent":
		opponent_score += 1
	
	print("Scores: [", player_score, ", ", opponent_score, "]")

# When the player or the opponent score
func _on_opponent_goal_body_entered(body: Node2D) -> void:
	if body.is_in_group("Balls"):
		var ball = body
		add_point("player")
		restart_game(ball)

func _on_player_goal_body_entered(body: Node2D) -> void:
	if body.is_in_group("Balls"):
		var ball = body
		add_point("opponent")
		restart_game(ball)

func restart_game(ball: Node2D):
	#remove current ball
	ball.queue_free.call_deferred()
	#launch a new one
	ball_spawner.launch_ball()
