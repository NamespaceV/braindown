class_name Pickup
extends Node2D

signal on_pickup

func _ready() -> void:
	$Area2D.body_entered.connect(on_enter)
	$AnimatedSprite2D.play("default")

func on_enter(body):
	var player = body as Player
	if player:
		player.pickup(self)
		on_pickup.emit()
		hide()
		call_deferred("disable_me")

func disable_me():
	process_mode = PROCESS_MODE_DISABLED
