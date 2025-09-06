extends Control

func _ready() -> void:
	$LabelCoins.text="Tu has coleccionado "+str(GameManager.coins)+" monedas"
	


func _on_button_return_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://menues/main_menues.tscn")
