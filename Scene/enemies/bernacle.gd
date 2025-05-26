extends Area2D
var FireBallScene= preload("res://Scene/enemies/projectiles/fireball.tscn")



func _on_timer_timeout() -> void:
	var fireball= FireBallScene.instantiate()
	fireball.position = $ShootPosition.position
	add_child(fireball)
