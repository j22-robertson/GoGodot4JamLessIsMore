extends RigidBody2D
var charge : bool = false
var setup: bool = false;
var target: Node2D;
var velocity : Vector2;

@export var speed :float = 100.0;
# Called when the node enters the scene tree for the first time.
func _ready():
	
	var x = randf_range(-1920.0,1920.0)
	var y= randf_range(-1080.0,1080.0)
	var new_position = Vector2(x,y);
	move_and_collide(new_position)
	##position = new_position;
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func respawn():
	var x = randf_range(-1920.0,1920.0)
	var y= randf_range(-1080.0,1080.0)
	var new_position = Vector2(x,y);
	position = new_position
	pass

func receive_damage(damage : int):
	$CPUParticles2D.emitting = true;
	get_parent().deal_damage(damage)
	pass

func _physics_process(delta):
	if position.distance_to(target.get_player_position())>10.0 && !charge:
		velocity = position.direction_to(target.get_player_position())*speed;
		move_and_collide(velocity * delta)
	else:
		charge = true
		velocity = position.direction_to(target.get_player_position())* speed;
		move_and_collide(velocity* 2 * delta)
	
	pass

