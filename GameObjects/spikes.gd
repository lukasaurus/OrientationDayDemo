extends Node2D



func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		get_tree().reload_current_scene()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		get_tree().reload_current_scene()
