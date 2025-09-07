extends CanvasLayer


func _process(_delta: float) -> void:
	$LabelLives.text= str(GameManager.lives)
	$LabelCoins.text= str(GameManager.coins)
