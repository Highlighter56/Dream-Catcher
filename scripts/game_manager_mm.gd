extends Node2D


func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass


# ---Load Scense---
# Load 3D
func _on_load_3d_pressed() -> void:
	get_tree().change_scene_to_file("res://scenses/game.tscn")
# Load 2D
func _on_load_2d_pressed() -> void:
	get_tree().change_scene_to_file("res://scenses/vertical_preview.tscn")
