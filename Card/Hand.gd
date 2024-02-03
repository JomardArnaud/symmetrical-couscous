extends Control

@onready var cardContainer = %CardContainer
@onready var nbCard = 0 :
	set(nNb):
		nbCard = nNb
		canDraw = (cardContainer.get_child_count() < nbHandCardMax)
@export var nbHandCardMax : int = 6 :
	set(nNb):
		nbHandCardMax = clampi(nNb, 0, nNb)
@onready var canDraw = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _input(event: InputEvent) -> void:
	if (event.is_action_pressed("playCard1")):
		if (cardContainer.get_child_count() > 0):
			cardContainer.get_child(0).discard()
	if (event.is_action_pressed("playCard2")):
		if (cardContainer.get_child_count() > 1):
			cardContainer.get_child(1).discard()
	if (event.is_action_pressed("playCard3")):
		if (cardContainer.get_child_count() > 2):
			cardContainer.get_child(2).discard()
	if (event.is_action_pressed("playCard4")):
		if (cardContainer.get_child_count() > 3):
			cardContainer.get_child(3).discard()
	if (event.is_action_pressed("playCard5")):
		if (cardContainer.get_child_count() > 4):
			cardContainer.get_child(4).discard()
	if (event.is_action_pressed("playCard6")):
		if (cardContainer.get_child_count() > 5):
			cardContainer.get_child(5).discard()
	pass

func addCard(card: Card) -> void:
	nbCard += 1
	cardContainer.add_child(card)
	card.set("recto", true)
	card.set("zone", Card.ZoneCard.hand)

func _on_card_container_child_order_changed() -> void:
	canDraw = (cardContainer.get_child_count() < nbHandCardMax)