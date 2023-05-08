extends RigidBody2D

var velocity : Vector2;

@export var speed = 400;

# Called when the node enters the scene tree for the first time.
func _ready():
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
	
	pass
	
func _physics_process(delta):
	get_input();
	move_and_collide(velocity * delta);
	pass
