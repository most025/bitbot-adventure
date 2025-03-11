extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -500.0
var gravity=800.0

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		# velocity += get_gravity * delta (esto es loque era antes)

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	# Añadiendo direccion de movimiento del sprite.
	# direction sprite
	if direction == 1:
		# si el jugador mira a la derecha se ejecuta 
		$AnimatedSprite2D.flip_h=false
	elif direction == -1:
		$AnimatedSprite2D.flip_h=true
	
	# Añadiendo deciones de acciones en el jugador 
	if not is_on_floor():
		#si el jugador no esta en el suelo se ejecuta este frame. 
		$AnimatedSprite2D.play("jump")
	elif direction != 0:
		# si el jugador se ha movido se ejecutara este frame.
		$AnimatedSprite2D.play("walk")
	else:
		# si el jugador no se ha movido se ejecutara este frame.
		$AnimatedSprite2D.play("idle")
