extends Node2D

class_name WeaponGroupComponent

@export var fire_weapon_detection : FireWeaponDetectionComponent
@export var firerate_timer : Timer
var pause : Timer = Timer.new()
@export var weapon_user : CharacterBody2D

var weapon_on : bool = false

func _ready():
	pause.one_shot = true
	pause.wait_time = firerate_timer.wait_time - 0.5
	add_child(pause)
	
	fire_weapon_detection.start_weapon_fire.connect(turn_weapons_on);
	fire_weapon_detection.stop_weapon_fire.connect(turn_weapons_of);
	
	firerate_timer.timeout.connect(fire_weapons)
	
func turn_weapons_on():
	weapon_on = true
	if pause.is_stopped():
		pause.start()
		firerate_timer.start()
		fire_weapons()
	
func turn_weapons_of():
	weapon_on = false
	
func fire_weapons():
	if weapon_on:
		for weapon in self.get_children():
			if weapon.has_method("fire_weapon"):
				weapon.fire_weapon(weapon_user)
				await get_tree().create_timer(0.1).timeout
