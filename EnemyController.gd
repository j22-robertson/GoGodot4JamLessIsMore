extends Node2D

@onready var rigid_body : RigidBody2D = $Enemy_Body;
var target : Node2D;
var pool;
var setup : bool = false;
var charge: bool = false;
@export var max_health : int = 20;
var health : int = 20;

# Called when the node enters the scene tree for the first time.
func _ready():
	rigid_body.target = target;
	health = max_health
	#disable()
	pass # Replace with function body.
	
func enable():
	$Enemy_Body.set_physics_process(true)
	$Enemy_Body/CollisionShape2D.set_deferred("disabled", false);
	$Enemy_Body/AnimatedSprite2D.play()
	$Enemy_Body.respawn()
	health = max_health
	visible = true
	pass
func deal_damage(damage : int, force: Vector2):
	health -= damage;
	if health <= 0:
		$Enemy_Body/GPUParticles2D2.emit_particle($Enemy_Body.transform, Vector2.ZERO,Color() ,Color() , GPUParticles2D.EMIT_FLAG_POSITION|GPUParticles2D.EMIT_FLAG_VELOCITY)
		$Enemy_Body.linear_velocity = Vector2.ZERO
		get_parent().remove_child(self)
	else:
		rigid_body.apply_central_impulse(force)
		$Enemy_Body/AudioStreamPlayer2D.pitch_scale = randf_range(1.0,1.5)
		$Enemy_Body/AudioStreamPlayer2D.play()
	
	pass

func disable():
	rigid_body.set_physics_process(false)
	$Enemy_Body/CollisionShape2D.set_deferred("disabled", true);
	$Enemy_Body/AnimatedSprite2D.pause()
	hide()
	rigid_body.bonked = false;
	#get_parent().remove_child(self)

	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.

