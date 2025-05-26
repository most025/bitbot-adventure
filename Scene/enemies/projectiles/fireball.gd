extends Area2D
var speed=200
var rotation_speed= 2 * TAU

func _process(delta: float) -> void:
	position.y += speed * delta
	$Sprite2D.rotate(rotation_speed * delta)


func _on_timer_timeout() -> void:
	queue_free()
