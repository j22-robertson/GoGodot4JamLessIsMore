extends Node2D
var rigid_body: RigidBody2D;
# Called when the node enters the scene tree for the first time.
func _ready():
	rigid_body = $PlayerBody
	pass # Replace with function body.

func get_player_position()-> Vector2:
	return rigid_body.position
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
