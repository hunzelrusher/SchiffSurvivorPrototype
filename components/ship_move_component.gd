extends Node

class_name ShipMoveComponent

@export var moving_character : CharacterBody2D
@export var target_direction : TargetDirectionComponent
@export var stats : ShipStatsComponent
@export var move_and_rotate : bool = false
@export var use_new : bool = false

@onready var audio_stream_player_2d = $"../../AudioStreamPlayer2D"


func _physics_process(_delta):
	if (!use_new):
		var target_velocity = target_direction.get_target_direction() * stats.SPEED
		
		var akt_velocity = moving_character.velocity
		
		if (akt_velocity == Vector2.ZERO):
			akt_velocity = Vector2.RIGHT * 20
			akt_velocity = akt_velocity.rotated(moving_character.rotation)
		
		moving_character.velocity = lerp(akt_velocity, target_velocity, stats.FRICTION)
		
	else:
		moving_character.velocity = lerp(
			moving_character.velocity,
			moving_character.transform.x * target_direction.get_target_acceleration() * (stats.SPEED + 50),
			stats.FRICTION
		)
		moving_character.rotation += (
			target_direction.get_target_rotation() *
			 _delta * 1.5
		)
		if moving_character.velocity.length() > 50 and moving_character.rotation_degrees > 90:
			if !audio_stream_player_2d.playing:
				audio_stream_player_2d.play(64)

	moving_character.move_and_slide()

	if (move_and_rotate):
		moving_character.rotation = lerp_angle(
			moving_character.rotation, 
			moving_character.velocity.normalized().angle(), 
			0.1
		)

