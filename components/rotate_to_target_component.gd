extends Node

class_name RotateToTargetComponent

@export var moving_character : Node2D
@export var target : GetTargetComponent

func _physics_process(_delta):
	moving_character.rotation = lerp_angle(
		moving_character.rotation, 
		moving_character.global_position.direction_to(target.get_target()).angle(), 
		0.1
	)
