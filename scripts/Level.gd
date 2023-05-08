extends Node2D

@export var spawn_pos = Vector2(0, 0)

func _ready():
	GlobalLevel.spawn_pos = spawn_pos
