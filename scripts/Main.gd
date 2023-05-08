extends Node2D

func set_level(level_name):
	for node in get_tree().get_nodes_in_group("level")+get_tree().get_nodes_in_group("player"):
		node.queue_free()
		
	add_child(load("res://levels/"+level_name+".tscn").instantiate())
	add_child(load("res://scenes/Player.tscn").instantiate())
	
	$Player.position = GlobalLevel.spawn_pos

func _ready():
	set_level(GlobalLevel.level_name)
