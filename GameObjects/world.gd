extends Node

func _ready():
	UiOverlay.coins = 0
	UiOverlay._ready()
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		get_tree().quit()
