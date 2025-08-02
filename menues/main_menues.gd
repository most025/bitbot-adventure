extends Control



func _on_button_play_pressed() -> void:
	get_tree().change_scene_to_file("res://Scene/main/level.tscn")


func _on_button_controls_pressed() -> void:
	get_tree().change_scene_to_file("res://menues/menu_controls.tscn")
