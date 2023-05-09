extends CharacterBody2D

const SPEED = 200.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@export var hp = 3
@export var damage = 1
@export var damage_speed = 1

var direction = 1
var enemy

func _ready():
	$Timer.wait_time = damage_speed
	
func _physics_process(delta):
	# Add the gravity.
	
	$HPLabel.text = str(hp)
	
	if position.y >= 700:
		hp = 0
	
	if hp == 0:
		hp = 3
		position = GlobalLevel.spawn_pos
		direction = GlobalLevel.spawn_direction
	
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	
	if direction == 1: $Sprite2D.flip_h = false
	elif direction == -1: $Sprite2D.flip_h = true
	
	if enemy == null:
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func _on_area_2d_body_entered(body):
	if body.is_in_group("flip"):
		direction *= -1
	
	if body.is_in_group("badguy"):
		body.enemy = self
		body.get_node("Timer").start()
		
		enemy = body
		$Timer.start()

func _on_timer_timeout():
	if enemy != null:
		enemy.hp -= damage
