extends Node2D
var velocity : Vector2 = Vector2.DOWN;
@export var speed =100;
var setup : bool = false;
var target: Node2D;
var parent : Node2D;


# Called when the node enters the scene tree for the first time.
func _ready():
	
	#target = p_node.target
	#var node = get_node("/root/Level/Player")
	
	var x = randf_range(0.0,1920.0)
	var y= randf_range(0.0,1080)

	position = Vector2(x,y);
	pass # Replace with function body.



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	if(setup):
		#position += velocity * delta;
		velocity = position.direction_to(target.get_player_position())*speed;
		position += velocity * delta;
	#if position.distance_to(target.position)>0.5:
		#position += velocity * delta;
	pass
