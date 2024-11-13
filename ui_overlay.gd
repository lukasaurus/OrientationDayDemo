extends CanvasLayer

var coins = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	coins = 0
	$AnimatedSprite2D/Label.text = "x0"
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func add_coin():
	coins += 1
	$AnimatedSprite2D/Label.text = "x"+str(coins)
