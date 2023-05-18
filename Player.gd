extends CharacterBody2D


var previous_rotation = 0.0;
var previous_direction : bool = false;
@export var speed = 400;
var start_rotation;
var start_direction : bool;
var counter : int = 0
var circling : bool = false
var prev_mouse_position;
@export var spin_force_modifier = 0.1;
@export var spin_force = 0.0
@export var momentum = 0.0;
@export var spin_loss_rate = 10;
@export var maximum_spin_force = 1000.0;

# Called when the node enters the scene tree for the first time.
func _ready():
	start_rotation =rotation_degrees;
	prev_mouse_position = get_global_mouse_position()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _input(event):
	
	pass

func get_input():
	var new_pos : Vector2 = get_global_mouse_position();
	spin_force += new_pos.distance_to(prev_mouse_position)
	prev_mouse_position = new_pos

	
	#look_at(get_global_mouse_position())
	var input_direction = Input.get_vector("Left","Right","Up","Down")
	velocity = input_direction * speed
	pass

func _physics_process(delta):
	get_input()
	
	if(spin_force > maximum_spin_force):
		spin_force = maximum_spin_force
	elif(spin_force < 0.0):
		spin_force = 0.0
	rotation += spin_force * spin_force_modifier * delta;
	spin_force -= spin_loss_rate; 
	#var player_rotation = rotation_degrees
	#var rotation_difference = player_rotation;
	move_and_slide()
	#move_and_slide();
	pass
func take_damage(damage: int):
	#player_death.emit()
	get_tree().change_scene_to_file("res://mainmenu.tscn")
	pass

func _on_weapon_has_bonked():
	spin_force *= 0.9
	pass # Replace with function body.
