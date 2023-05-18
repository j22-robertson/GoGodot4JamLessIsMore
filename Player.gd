extends CharacterBody2D


var previous_rotation = 0.0;
var previous_direction : bool = false;
@export var speed = 400;
var start_rotation;
var start_direction : bool;
var counter : int = 0
var circling : bool = false
# Called when the node enters the scene tree for the first time.
func _ready():
	start_rotation =rotation_degrees;
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _input(event):
	pass
func get_input():
	look_at(get_global_mouse_position())
	var input_direction = Input.get_vector("Left","Right","Up","Down")
	velocity = input_direction * speed
	pass
	
func _process(delta):
	$Counter.text = "Counter current:" + str(counter)
	var abs_rot = rotation_degrees + 180
	if abs_rot == previous_rotation:
		previous_rotation = abs_rot;
		pass
	
	var rotation_diff = abs_rot - previous_rotation;
	previous_rotation = abs_rot
	if rotation_diff == 0:
		pass
	var direction : bool = rotation_diff >0;
	
	if direction != previous_direction:
		start_rotation = rotation_degrees + 180;
		previous_direction = direction
		circling = false
		pass
	else:
		var greater = abs(start_rotation -5)
		var lessthan = min(start_rotation+5, 360)
		var opp_angle = abs(start_rotation -180)
		if abs_rot >= greater && abs_rot <= lessthan && circling:
			circling = false
			counter+=1
		elif abs_rot >= abs(opp_angle-5) && abs_rot <= min(opp_angle+5,360):
			circling = true
	
	

	pass
	
func _physics_process(delta):
	var player_rotation = rotation_degrees
	var rotation_difference = player_rotation;
	
	get_input();
	move_and_slide();
	pass
