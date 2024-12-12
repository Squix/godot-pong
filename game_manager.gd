extends Node

var player_score = 0
var opponent_score = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func add_point(target: String):
	if target == "player":
		player_score += 1
	elif target == "opponent":
		opponent_score += 1
	
	print("Scores: [", player_score, ", ", opponent_score, "]")

func _on_opponent_goal_body_entered(body: Node2D) -> void:
	add_point("player")

func _on_player_goal_body_entered(body: Node2D) -> void:
	add_point("opponent")
