extends Node2D

signal player_spawned(player);
var time = 0.0;
var seconds : float= 0.0;
var minutes = 0;
var ms = 0.0;
var player_score : int = 0;
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#time += delta
	seconds+= delta
	if seconds >=60:
		minutes +=1
		seconds = 0.0
	
	$"Game timer".text = str(minutes)+ ":" +str(seconds as int)
	#$"Game timer".text = str(time);
	pass

func _input(event):
	if event.is_action("Pause"):
		if !get_tree().paused:
			get_tree().paused = true;
			$PopupMenu.show()
		else:
			$PopupMenu.hide()
			get_tree().paused = false;
			
	pass
func _on_player_ready():
	player_spawned.emit(get_node("Player"))
	pass # Replace with function body.


func _on_enemy_pool_enemy_slain(score):
	player_score += score;
	$Score.text = str(player_score)
	pass # Replace with function body.


func _on_enemy_pool_2_enemy_slain(score):
	player_score += score;
	$Score.text += player_score;
	pass # Replace with function body.
