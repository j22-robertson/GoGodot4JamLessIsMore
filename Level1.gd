extends Node2D

signal player_spawned(player);

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_player_ready():
	player_spawned.emit(get_node("Player"))
	pass # Replace with function body.
