extends Node2D

var enemy_scene : = preload("res://enemy_base.tscn");

var enemy_pool : Array;
@export var max_spawn : int;
@export var target : Node2D;
@export var duration_between_spawns = 5.0;
var timer = 0.0;

# Called when the node enters the scene tree for the first time.
func _ready():
	
	#init_pool();
	pass # Replace with function body.

func init_pool():
	for i in range(max_spawn):
		var obj  := enemy_scene.instantiate()
		enemy_pool.append(obj)
	
		add_child(obj)
	pass
	
func spawn_enemy():
	var obj = enemy_pool.pop_back();
	obj.target = target;
	#obj.parent = self;
	obj.enable();
	return obj
	pass

func try_spawn():
	if(enemy_pool.size() >0):
		var enemy = spawn_enemy()
	else:
		print_debug("No enemies to spawn")
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(timer < duration_between_spawns):
		timer+= delta
	else:
		timer = 0.0
		try_spawn()

	pass


func _on_refund(obj):
	obj.disable()
	enemy_pool.push_back(obj)
	pass

func _on_level_player_spawned(player):
	target = player;
	init_pool()
	pass # Replace with function body.


func _on_child_entered_tree(node):

	node.target = target;
	
	#node.get_child("RigidBody2D").setup = true
	#node.get_child("RigidBody2D").target = target
	#node.setup = true
	#node.target = target
	pass # Replace with function body.
