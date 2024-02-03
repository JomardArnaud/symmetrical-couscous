extends Control

@onready var cardScene = preload("res://Card/Card.tscn")
@onready var nbCardLeft : int = 6 :
	set(nLeft):
		nbCardLeft = nLeft
		if labelLeftCard != null:
			labelLeftCard.text = str("Left card" + ("s" if nbCardLeft > 1 else "") + " : " + str(nbCardLeft))
@onready var labelLeftCard = %LabelLeftCard

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	labelLeftCard.text = str("Left card" + ("s" if nbCardLeft > 1 else "") + " : " + str(nbCardLeft))

func draw() -> Card:
	if nbCardLeft == 0:
		return null
	var tmpCard = cardScene.instantiate()
	nbCardLeft -= 1
	if nbCardLeft == 0:
		%Card.queue_free()
	return tmpCard

func _on_area_2d_mouse_entered() -> void:
	labelLeftCard.visible = true

func _on_area_2d_mouse_exited() -> void:
	labelLeftCard.visible = false

