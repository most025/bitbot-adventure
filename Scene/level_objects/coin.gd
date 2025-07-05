extends Area2D
# variable de velocidad de giro de la moneda.
var flip_speed= 1 * TAU
#variable del transcurso del tiempo
var flip_amount= 0


func _process(delta: float) -> void:
	flip_amount += flip_speed * delta
	$Sprite2D.scale.x= 0.5 * sin(flip_amount)
