extends Control

func _ready() -> void:
	$LabelCoins.text="Tu has coleccionado "+str(GameManager.coins)+" monedas"
	
