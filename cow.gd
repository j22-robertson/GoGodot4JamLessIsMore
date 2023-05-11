extends RigidBody2D
var charge : bool = false
var setup: bool = false;
var target: Node2D;
var velocity : Vector2;
var bonked = false;
@export var speed :float = 100.0;
;
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

func receive_damage(damage : int, force: Vector2):
	#$GPUParticles2D.emitting = true;
	get_parent().deal_damage(damage, force)
	pass
func _integrate_forces(state):
	#if !bonked:
		#if posaition.distance_to(target.get_player_position())>10.0:
			##linear_velocity= position.direction_to(target.get_player_position()).normalized() *speed;
			
		#else:
			##linear_velocity=  position.direction_to(target.get_player_position()).normalized() * speed *2;
	#else:
		#state.get_contact_collider()
	var tv = abs(linear_velocity.x) + abs(linear_velocity.y)
	if bonked:
		rotation_degrees = -90 + rad_to_deg(linear_velocity.angle())
		$GPUParticles2D.emit_particle(transform, linear_velocity.normalized(),Color(),Color(),GPUParticles2D.EMIT_FLAG_POSITION|GPUParticles2D.EMIT_FLAG_VELOCITY)
	
	
	if tv < 100:
		linear_velocity = Vector2.ZERO
		bonked = false;
	pass

func _physics_process(delta):
	
	#rotation_degrees=  get_angle_to(target.get_player_position())
	#look_at(target.position)
	if !bonked:
		$GPUParticles2D.emitting = false;
		var collision_info = move_and_collide(position.direction_to(target.get_player_position()).normalized() *speed * delta);
		rotation_degrees =   rad_to_deg(position.direction_to(target.get_player_position()).angle())
		if collision_info && bonked:
			var rbody = collision_info.get_collider()
			rbody.set("bonked", true)
		# = true
			velocity = velocity.bounce(collision_info.get_normal())
	pass

