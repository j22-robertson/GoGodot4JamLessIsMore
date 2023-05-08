extends Node2D

@export var rigid_body : RigidBody2D;
var target : Node2D;
var pool;
var setup : bool = false;
var charge: bool = false;
@export var health : int = 10;
# Called when the node enters the scene tree for the first time.
func _ready():
	rigid_body.target = target;
	disable()
	pass # Replace with function body.



func enable():
	rigid_body.set_physics_process( true)
	$Enemy_Body/CollisionShape2D.set_deferred("disabled", false);
	$Enemy_Body/AnimatedSprite2D.play()
	rigid_body.respawn()
	
	visible = true
	pass

func deal_damage(damage : int):
	health -= damage;
	
	if health < 0:
		disable()
		get_parent().remove_child(self)
	
	pass

func disable():
	
	rigid_body.set_physics_process(false)
	$Enemy_Body/CollisionShape2D.set_deferred("disabled", true);
	$Enemy_Body/AnimatedSprite2D.pause()
	hide()
	#get_parent().remove_child(self)

	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.

