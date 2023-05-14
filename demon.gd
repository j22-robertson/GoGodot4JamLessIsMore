extends "res://cow.gd"

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
		var collision_info;
		$GPUParticles2D.emitting = false;
		if position.distance_to(target.get_player_position()) > 500:
			collision_info = move_and_collide(position.direction_to(target.get_player_position()).normalized() *speed * delta);
			##print_debug("Shooting fireball");
		else:
			collision_info = move_and_collide(position.direction_to(-target.get_player_position()).normalized() *speed * delta);
			#print_debug("Running away");
		rotation_degrees =   rad_to_deg(position.direction_to(target.get_player_position()).angle())
		if collision_info && bonked:
			var rbody = collision_info.get_collider()
			rbody.set("bonked", true)
		# = true
			velocity = velocity.bounce(collision_info.get_normal())
	pass
