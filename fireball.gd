extends Node2D

var dir: Vector2 = Vector2.ZERO;
@export_range(0.0,100000.0) var speed: float = 200.0;
var timer = 0.0;
@export var despawn_time = 4.0
var damage = 10.0;
# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.

func shoot(direction: Vector2):
	dir = direction;
	
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += dir * speed * delta;
	if(timer < despawn_time):
		timer += delta
		rotation_degrees = -90 + rad_to_deg(dir.angle())
		#rotation_degrees = rad_to_deg(dir.angle())
	else:
		get_parent().remove_child(self);
	pass
func _disable():
	
	pass

func _on_area_2d_body_entered(body):
	body.call("take_damage", 1);
	#print_debug("Player shot!")
	get_parent().call_deferred("remove_child", self);
	pass # Replace with function body.
