extends Node

var deaths = 0
var start_timestamp_ms = 0

func _ready() -> void:
	start_timestamp_ms = Time.get_ticks_msec()

func player_died():
	deaths += 1

func get_playtime_seconds() -> float:
	return (Time.get_ticks_msec() - start_timestamp_ms) / 1000.0
