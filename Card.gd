class_name Card
extends Control

signal sendGraveyard()

enum cardType {
	weapon
}

var stateAnimCard = ["verso", "recto"]

@export var faceUp : bool = false :
	set(value):
		faceUp = value
		# if (sprite != null):
		# 	sprite.play(stateAnimCard[int(faceUp)])

@export var type : cardType

@onready var recto := false :
	set (value):
		recto = value
		if animeTree != null:
			animeTree.active = true
@onready var animeTree = %AnimationTree

# @onready var sprite := %Sprite

# func _ready() -> void:
# 	sprite.play(stateAnimCard[int(faceUp)])

func _on_button_pressed() -> void:
	emit_signal("sendGraveyard", self)
