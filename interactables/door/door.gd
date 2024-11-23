extends Node2D

@onready var sprite = $AnimatedSprite2D as AnimatedSprite2D

@export var next_level_name = "level1-2"

var opened := false

func _ready() -> void:
	sprite.play("default")
	$Area2D.body_entered.connect(on_enter)

func open_door():
	sprite.play("open")
	sprite.animation_finished.connect(open_finished)

func open_finished():
	sprite.pause()
	opened = true

func on_enter(body):
	var player = body as Player
	if player:
		if opened:
			call_deferred("change_level")

func change_level():
	get_tree().change_scene_to_file("res://%s.tscn" % [next_level_name])
