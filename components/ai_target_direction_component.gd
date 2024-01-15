extends TargetDirectionComponent

class_name AiTargetDirectionComponent

@onready var player : CharacterBody2D = get_node("/root/World/PlayerShip")

func get_target_direction() -> Vector2 :
	if (get_parent().global_position.distance_to(player.global_position) > 200):
		var direction = get_parent().global_position.direction_to(player.global_position)
		return direction.normalized()
	else:
		return Vector2.ZERO


