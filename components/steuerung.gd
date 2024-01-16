extends Node2D

class_name Steuerung

signal steuerung_changed

@export var steuerung_neu : bool = false :
	set(value):
		steuerung_neu = value
		steuerung_changed.emit(value)
