extends Node2D
var enemy_scene : = preload("res://enemy_base.tscn");
signal enemy_slain(score: int)
var enemy_pool : Array;
@export var max_spawn : int = 1000;
@export_range(0,100) var start_spawn : int;
@export var target : Node2D;
@export var duration_between_spawns = 5.0;
@export var score_value: int = 10;
var current_held :int= 0;
var current_spawned: int = 0;
var timer = 0.0;

# Called when the node enters the scene tree for the first time.
func _ready():
	#init_pool();
	pass # Replace with function body.
	
func spawn_enemy():
	var obj = enemy_pool.pop_back();
	add_child(obj)
	#obj.target = target;
	#obj.enable();
	pass

func load_enemy():
	var obj  := enemy_scene.instantiate()
	obj.set("target",target)
	add_child(obj)
	current_held+=1
	pass

func try_spawn():
	if(enemy_pool.size() >0):
		spawn_enemy()
	else:
		if current_held <= max_spawn:
			load_enemy()
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(timer < duration_between_spawns):
		timer+= delta
	else:
		timer = 0.0
		try_spawn()
	pass

func _input(event):
	if event.is_action("Display Debug"):
		print_debug("demon_pool count:" + str(current_held))
	pass
func _on_refund(obj):
	obj.disable()
	enemy_pool.push_back(obj)
	pass

func _on_level_player_spawned(player):
	target = player;
	##init_pool()
	pass # Replace with function body.


func _on_child_entered_tree(node):
	current_spawned+=1;
	node.enable();
	pass # Replace with function body.
	
func _on_child_exiting_tree(node):
	current_spawned+=1
	node.disable()
	enemy_pool.push_back(node)
	enemy_slain.emit(score_value);
	pass # Replace with function body.
