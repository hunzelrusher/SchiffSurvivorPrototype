extends Node2D

@onready var spawner_component = $SpawnerComponent
@onready var animated_sprite_2d = $AnimatedSprite2D

func fire_weapon(weapon_user : CharacterBody2D):
	var cannon_ball = spawner_component.spawn()
	var base_velocity = weapon_user.velocity
	var target_velocity = Vector2(0, -450).rotated(global_rotation) + base_velocity
	cannon_ball.linear_velocity = target_velocity
	animated_sprite_2d.play("fire")
