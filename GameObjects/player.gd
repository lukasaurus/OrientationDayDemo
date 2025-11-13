extends CharacterBody2D
class_name Player
@export var speed = 300.0
@export var jump_power = -300.0
@export var acceleration = 5.0
var jumps_remaining = 2

var SPEED = speed * 100
var JUMP_POWER = -jump_power * 100
var ACCELERATION = acceleration

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	else:
		jumps_remaining = 2
	
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and jumps_remaining > 0:
		velocity.y = JUMP_VELOCITY
		jumps_remaining -= 1
	
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

func _on_goal_body_entered(body: Node2D) -> void:
	if body is Player:
		get_tree().change_scene_to_file("res://Sprites/UI/end_screen.tscn")
