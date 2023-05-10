extends Node2D

@export var rigid_body : RigidBody2D;
var target : Node2D;
var pool;
var setup : bool = false;
var charge: bool = false;
@export var max_health : int = 10;
var health : int = 0;
# Called when the node enters the scene tree for the first time.
func _ready():
	rigid_body.target = target;
	health = max_health
	#disable()
	pass # Replace with function body.



func enable():
	rigid_body.set_physics_process( true)
	$Enemy_Body/CollisionShape2D.set_deferred("disabled", false);
	$Enemy_Body/AnimatedSprite2D.play()
	rigid_body.respawn()
	health = max_health
	visible = true
	pass

func deal_damage(damage : int):
	health -= damage;
	
	if health < 0:
		get_parent().remove_child(self)
		$Enemy_Body.linear_velocity = Vector2.ZERO
	
	pass

func disable():
	rigid_body.set_physics_process(false)
	$Enemy_Body/CollisionShape2D.set_deferred("disabled", true);
	$Enemy_Body/AnimatedSprite2D.pause()
	hide()
	#get_parent().remove_child(self)

	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.

