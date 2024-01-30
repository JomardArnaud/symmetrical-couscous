extends CanvasLayer

@onready var handCardContainer = $PanelHand/MarginContainer/BoxContainer/HBoxContainer
@onready var graveyardCardContainer = $PanelGraveyard/MarginContainer/VBoxContainer
@onready var deckCardContainer = %Deck

## bon faudras tej la logique des cartes de l'HUD mais pour l'instant fair enough
@onready var nbCardHand = 0
@onready var nbCardDeck = 10
@onready var nbCardGraveyard = 0
@export var nbCardAtBegin : int = 5
@export var nbHandCardMax : int = 8

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in range(nbCardAtBegin):
		draw()

func _input(event: InputEvent) -> void:
	if (event.is_action("draw")):
		draw()

func draw() -> void:
	if (nbCardHand < nbHandCardMax):
		nbCardHand += 1
	else:
		return
	var tmpCard = deckCardContainer.draw()
	if tmpCard == null:
		return
	handCardContainer.add_child(tmpCard)
	tmpCard.set("faceUp", true)
	tmpCard.sendGraveyard.connect(sendGraveyard)

func sendGraveyard(card: Card) -> void:
	card.reparent(graveyardCardContainer)