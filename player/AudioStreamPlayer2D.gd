extends AudioStreamPlayer2D

@onready var player_ship = $".."


func _ready():
	player_ship.steuerung.steuerung_changed.connect(func(val : bool):
		if val == false:
			stop()
		)
