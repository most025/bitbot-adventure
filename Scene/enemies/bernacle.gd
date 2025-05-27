extends Area2D
var FireBallScene= preload("res://Scene/enemies/projectiles/fireball.tscn")



func _on_timer_timeout() -> void:
	var fire_ball= FireBallScene.instantiate()
	fire_ball.position = $ShootPosition.position
	add_child(fire_ball)
