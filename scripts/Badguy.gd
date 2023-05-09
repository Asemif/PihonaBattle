extends CharacterBody2D

var enemy

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@export var hp = 3
@export var damage = 1
@export var damage_speed = 1

func _ready():
	$Timer.wait_time = damage_speed

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta

func _on_timer_timeout():
	enemy.hp -= damage
