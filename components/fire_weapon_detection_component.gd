extends Area2D

class_name FireWeaponDetectionComponent

@export var preame_direction = 1
@onready var collision_shape_2d = $CollisionShape2D
@onready var player_ship = $"../.."

var collision_pos_x

signal start_weapon_fire
signal stop_weapon_fire

func _ready():
	collision_pos_x = collision_shape_2d.position.x

func _physics_process(delta):
	#preame
	collision_shape_2d.position.x = collision_pos_x + player_ship.velocity.length() / 10 * preame_direction

func _on_body_entered(_body):
	var enemies_in_range = get_overlapping_bodies()
	if enemies_in_range.size() > 0:
		start_weapon_fire.emit()

func _on_body_exited(_body):
	var enemies_in_range = get_overlapping_bodies()
	if enemies_in_range.size() == 0:
		stop_weapon_fire.emit()
