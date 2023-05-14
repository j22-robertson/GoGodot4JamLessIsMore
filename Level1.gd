extends Node2D

signal player_spawned(player);
var time = 0.0;
var seconds : float= 0.0;
var minutes = 0;
var ms = 0.0;
var player_score : int = 0;
var minute_string : String;
var second_string : String;
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _spawn_projectile(position: Vector2, direction: Vector2):
	$FireballPool.try_spawn(position ,direction)
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#time += delta
	seconds+= delta
	if seconds >=60:
		minutes +=1
		$"Enemy Pool".max_spawn += 50
		$"Enemy Pool2".max_spawn += 10
		seconds = 0.0
	
	if seconds < 10:
		second_string = "0" + str(seconds as int)
	else:
		second_string = str(seconds as int)
	if minutes < 10:
		minute_string = "0"+str(minutes);
	else:
		minute_string = str(minutes);
	$"Game timer".text = minute_string+ ":" + second_string	
	#$"Game timer".text = str(time);
	pass


func _on_player_ready():
	player_spawned.emit(get_node("Player"))
	pass # Replace with function body.
	
func _input(event):
	if event.is_action("Pause"):
		if !get_tree().paused:
			get_tree().paused = true;
			$PopupMenu.show()
		else:
			get_tree().paused = false;
			
			$PopupMenu.hide()
		print_debug("Unpausing")
	pass

func _on_enemy_pool_enemy_slain(score):
	player_score += score;
	$Score.text = str(player_score)
	pass # Replace with function body.


func _on_enemy_pool_2_enemy_slain(score):
	player_score += score;
	$Score.text += player_score;
	pass # Replace with function body.


func _on_player_player_death():
	get_tree().change_scene_to_file("res://mainmenu.tscn")
	pass # Replace with function body.


func _on_audio_stream_player_finished():
	$AudioStreamPlayer.play(0.0)
	pass # Replace with function body.
