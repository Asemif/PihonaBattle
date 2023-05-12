extends Node2D

func _process(delta):
	$BG.scale.x = get_viewport().get_visible_rect().size.x
	$VS.position.x = get_viewport().get_visible_rect().size.x/2
