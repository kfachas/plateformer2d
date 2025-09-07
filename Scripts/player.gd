extends CharacterBody2D

@onready var animated_sprite2d: AnimatedSprite2D = $AnimatedSprite2D

const SPEED = 200.0
const JUMP_VELOCITY = -300.0

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		animated_sprite2d.play("jump")
	
	var direction := Input.get_axis("ui_left", "ui_right")
	
	if direction:
		velocity.x = direction * SPEED
		animated_sprite2d.play('walk')
		animated_sprite2d.flip_h = direction < 0
	else:
		animated_sprite2d.play('idle')
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
