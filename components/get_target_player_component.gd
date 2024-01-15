extends GetTargetComponent

class_name GetTargetPlayerComponent

@onready var player : CharacterBody2D = get_node("/root/World/PlayerShip")

func get_target() -> Vector2:
	return player.global_position
