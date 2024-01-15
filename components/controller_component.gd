extends TargetDirectionComponent

class_name ControllerComponent

func get_target_direction() -> Vector2 :
	return Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
func get_target_acceleration() -> float :
	return Input.get_axis("ui_down", "ui_up")
	
func get_target_rotation() -> float :
	return Input.get_axis("ui_left", "ui_right")
