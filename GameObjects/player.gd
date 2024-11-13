extends CharacterBody2D
class_name Player

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const ACCELERATION = 5.0

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = move_toward(velocity.x, direction * SPEED, ACCELERATION)
		$AnimatedSprite2D.play("run")
	else:
		velocity.x = move_toward(velocity.x, 0, ACCELERATION)
		$AnimatedSprite2D.play("idle")
		
	if not is_on_floor():
		$AnimatedSprite2D.play("air")
		
	if direction < 0:
		$AnimatedSprite2D.flip_h = true
	if direction > 0:
		$AnimatedSprite2D.flip_h = false

	move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		get_tree().reload_current_scene()
