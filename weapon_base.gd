extends Node2D

@onready var WeaponBody = $WeaponBody

@export_range(0.0,60.0) var cooldown: float = 1.0
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


func _on_area_2d_body_entered(body: Node2D):
	body.get_parent().get_parent()._on_refund(body.get_parent())
	
	
	pass # Replace with function body.

