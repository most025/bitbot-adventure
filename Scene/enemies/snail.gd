extends CharacterBody2D


const SPEED = 100.0
var direction= -1

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	if (is_on_wall()):
		if (get_wall_normal().x > 0):
			direction= 1
			$AnimatedSprite2D.flip_h= true
		elif (get_wall_normal().x < 0):
				direction= -1
				$AnimatedSprite2D.flip_h= false
	
	velocity.x = direction * SPEED

	move_and_slide()
