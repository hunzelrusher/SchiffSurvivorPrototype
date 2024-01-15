extends RigidBody2D

@onready var scale_component = $ScaleComponent

func _ready():
	scale_component.tween_scale()

func _physics_process(_delta):
	if linear_velocity.length() <= 10:
		queue_free()
