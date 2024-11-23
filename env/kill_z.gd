extends Area2D

func _ready() -> void:
	body_entered.connect(on_enter)

func on_enter(body):
	var player = body as Player
	if player:
		player.killZ()
