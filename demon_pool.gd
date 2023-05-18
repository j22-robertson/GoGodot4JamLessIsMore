extends "res://Enemy Pool.gd";
var demon_scene = preload("res://enemy_demon.tscn")


## READ LATER
# Find enemy with smallest distance optimization
# only search within range e.g screenspace




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
	var obj  := demon_scene.instantiate()
	obj.set("target",target)
	obj.get_node("Enemy_Body").connect("shoot", get_parent()._spawn_projectile);
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
	node.enable();
	pass # Replace with function body.
	
func _on_child_exiting_tree(node):
	node.disable()
	enemy_pool.push_back(node)
	pass # Replace with function body.
