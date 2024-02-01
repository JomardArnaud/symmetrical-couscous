class_name Card
extends Control

signal sendGraveyard()

enum cardType {
	weapon
}

var stateAnimCard = ["verso", "recto"]

@export var type : cardType

@onready var recto := false :
	set (value):
		recto = value
		if animationPlayer != null:
			animationPlayer.play("flip_recto")
@onready var animationPlayer = %AnimationPlayer

func _on_button_pressed() -> void:
	emit_signal("sendGraveyard", self)
