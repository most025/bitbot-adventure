extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -500.0
var gravity=800.0
var coins = 0
var lives = 3
var last_checkpoint_position= Vector2.ZERO

func _ready() -> void:
	last_checkpoint_position= position

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
		# si el jugador mira a la derecha se ejecuta la siguiente linea de codigo.
		$AnimatedSprite2D.flip_h=false
	elif direction == -1:
		# si el jugador mira a la izquierda se  ejecuta la siguiente linea de codigo.
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

func lose():
	lives -= 1
	if lives > 0:
		position = last_checkpoint_position
	else:
		get_tree().reload_current_scene()

# Función con la lógica que determina la colición del jugador con el enemigo aereo.
func colisionar_con_enemigo(enemy):
	if (position.y < enemy.position.y):
		enemy.queue_free()
		velocity.y=JUMP_VELOCITY
	else:
		lose()
# Función que permite la colición con eneigos aereos.
func _on_area_2d_area_entered(area):
	if (area.is_in_group("enemies")):
		colisionar_con_enemigo(area)
	elif (area.is_in_group("deatzone")) or (area.is_in_group("projectiles")):
		lose()
	elif (area.is_in_group("coins")):
		coins += 1
		area.queue_free()
	elif (area.is_in_group("one_ups")):
		lives+=1
		area.queue_free()
	elif (area.is_in_group("checkpoints")):
		last_checkpoint_position= area.position
		area.take()

# Función que permite la colición con enemigos terrestres.
func _on_area_2d_body_entered(body: Node2D) -> void:
		if (body.is_in_group("enemies")):
			colisionar_con_enemigo(body)
