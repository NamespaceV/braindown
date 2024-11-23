class_name Player
extends CharacterBody2D

var speed = 250
var gravity = 5000
var jump_v = -1000
var fall_speed = 200

var checkpoint : Vector2

@onready var sprite = $AnimatedSprite2D as AnimatedSprite2D

func _ready() -> void:
	sprite.play("idle")
	floor_constant_speed = true
	checkpoint = position

func _process(delta: float) -> void:
	var input := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	input.y = 0
	velocity.x = input.x * speed
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		velocity.y = jump_v
	velocity.y += delta * gravity
	velocity.y = clamp(velocity.y, jump_v, fall_speed)
	if velocity.x < 0:
		sprite.flip_h = true
		sprite.play("run")
	elif velocity.x > 0:
		sprite.flip_h = false
		sprite.play("run")
	else :
		sprite.play("idle")
	move_and_slide()
	#print(velocity)

func killZ():
	position = checkpoint
	GAME.player_died()

func pickup(_item):
	pass
