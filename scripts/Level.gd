extends Node2D

@export var spawn_pos = Vector2(0, 0)
@export_range(-1, 1, 2) var spawn_direction = 1

func _ready():
	GlobalLevel.spawn_pos = spawn_pos
	GlobalLevel.spawn_direction = spawn_direction
