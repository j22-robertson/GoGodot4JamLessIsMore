extends Node2D
var player_body: CharacterBody2D;
signal player_death()
# Called when the node enters the scene tree for the first time.
func _ready():
	player_body = $PlayerBody
	pass # Replace with function body.

func get_player_position()-> Vector2:
	return player_body.position
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
