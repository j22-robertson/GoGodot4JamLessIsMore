extends Node2D
var fireball_scene = preload("res://fireball.tscn")
var fireball_pool : Array;
@export var max_spawn : int = 1000;
@export_range(0,100) var start_spawn : int;
var timer = 0;
# Called when the node enters the scene tree for the first time.
var current_held: int = 0
func _ready():
	pass
func spawn_enemy(_position: Vector2,direction : Vector2):
	var obj = fireball_pool.pop_back();
	obj.dir= direction
	obj.position = _position
	obj.timer = 0.0
	add_child(obj)
	
	pass

func load_enemy(_position: Vector2,direction: Vector2):
	var obj  := fireball_scene.instantiate()
	add_child(obj)
	obj.dir = direction
	obj.position = _position
	obj.timer = 0.0
	#print_debug("Direction:" + str(direction))
	current_held+=1
	pass

func try_spawn(_position: Vector2,direction: Vector2):
	if(fireball_pool.size() >0):
		spawn_enemy(_position,direction)
	else:
		if current_held <= max_spawn:
			load_enemy(_position,direction)
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.


func _on_child_entered_tree(node):
	pass # Replace with function body.


func _on_child_exiting_tree(node):
	fireball_pool.append(node)
	pass # Replace with function body.
