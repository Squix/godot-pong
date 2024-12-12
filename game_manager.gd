extends Node

var player_score = 0
var opponent_score = 0

@onready var player_score_text: Label = $PlayerScoreText
@onready var opponent_score_text: Label = $OpponentScoreText

@onready var ball_spawner: Marker2D = %BallSpawner

# Update scores
func add_point(target: String):
	if target == "player":
		player_score += 1
		player_score_text.text = str(player_score)
	elif target == "opponent":
		opponent_score += 1
		opponent_score_text.text = str(opponent_score)
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
