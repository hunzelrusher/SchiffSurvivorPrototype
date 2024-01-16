extends CheckButton

@export var steuerung : Steuerung

func _on_toggled(toggled_on):
	steuerung.steuerung_neu = toggled_on
