extends Node2D

@export_placeholder("Background Node Name") var bg_name = "Winter"

func _ready():
	for bg in get_tree().get_nodes_in_group("background"):
		bg.visible = false
		
	get_node(bg_name).visible = true
