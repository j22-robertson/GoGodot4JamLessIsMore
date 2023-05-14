extends Node2D

signal has_bonked();
@onready var WeaponBody = $WeaponBody

@export_range(0.0,60.0) var cooldown: float = 1.0
@export_range(0.0,1000000.0) var bonk_force = 600.0;

var timer: = 0.0

func _attack(direction: Vector2):
	if timer <= 0.0:
		timer += cooldown
		WeaponBody.activate(direction)
	pass


# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if timer >cooldown:
		timer-=delta
	pass



func _on_area_2d_body_entered(body: RigidBody2D):
	has_bonked.emit()
	if(!body.bonked):
		var force = position.direction_to(body.position).normalized() * bonk_force
		body.bonked = true
		body.receive_damage(10, force)
		
	else :
			var force = position.direction_to(body.position).normalized() * bonk_force
			body.bonked = true
			body.receive_damage(0, force)
	pass 
	# Replace with function body.

