extends CanvasLayer


func _process(delta: float) -> void:
	$LabelLives.text= str(GameManager.lives)
	$LabelCoins.text= str(GameManager.coins)
