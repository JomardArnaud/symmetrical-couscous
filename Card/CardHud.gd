extends CanvasLayer


@onready var deck = %Deck
@onready var hand = %Hand
@onready var graveyard = $PanelGraveyard/MarginContainer/VBoxContainer

## bon faudras tej la logique des cartes de l'HUD mais pour l'instant fair enough

@onready var nbCardGraveyard = 0
@export var nbCardAtBegin : int = 5
@export var nbHandCardMax : int = 6

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hand.set("nbHandCardMax", nbHandCardMax)
	for i in range(nbCardAtBegin):
		draw()

func _input(event: InputEvent) -> void:
	if (event.is_action_pressed("draw")):
		draw()

func draw() -> void:
	if (!hand.canDraw):
		return
	var tmpCard = deck.draw()
	if tmpCard == null:
		return
	hand.addCard(tmpCard)
	tmpCard.changeZone.connect(changeCardZone)

func getZone(dest: Card.ZoneCard) -> Control:
	match dest:
		Card.ZoneCard.deck:
			return deck
		Card.ZoneCard.hand:
			return hand
		Card.ZoneCard.graveyard:
			return graveyard
		_:
			return null
			
func changeCardZone(card: Card, dest: Card.ZoneCard) -> void:
	getZone(card.zone).nbCard -= 1
	card.reparent(getZone(dest))
