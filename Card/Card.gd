class_name Card
extends Control

signal discarded()

signal changeZone()

enum ZoneCard {
	deck,
	hand,
	inPlay,
	graveyard
}

enum CardType {
	weapon
}

@export var type : CardType

@onready var recto := false :
	set (value):
		recto = value
		if animationPlayer != null:
			animationPlayer.play("flip_recto")
@onready var animationPlayer = %AnimationPlayer
@onready var zone : ZoneCard = ZoneCard.deck:
	set(nZone):
		zone = nZone
@onready var listTriggerEffect : Array[Callable]

func _on_button_pressed() -> void:
	emit_signal("changeZone", self, ZoneCard.graveyard)


##
# Keyword
##

func discard() -> void:
	emit_signal("changeZone", self, ZoneCard.graveyard)