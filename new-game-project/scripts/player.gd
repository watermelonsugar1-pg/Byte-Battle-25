extends CharacterBody2D

const SPEED = 150.0
const JUMP_VELOCITY = -270.0
const BULLET_SCENE := preload("res://scenes/bullet.tscn")  # adjust path

var facing := 1  # 1 = right, -1 = left

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump (UP ARROW instead of space)
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Movement
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		facing = sign(direction)  # remember which way we're facing
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

	# Shooting (left-click mapped to "shoot")
	if Input.is_action_just_pressed("shoot"):
		shoot()


func shoot() -> void:
	var bullet = BULLET_SCENE.instantiate()
	# spawn slightly in front of player
	bullet.global_position = global_position + Vector2(16 * facing, 0)
	bullet.direction = Vector2(facing, 0)  # make bullet go left or right

	get_tree().current_scene.add_child(bullet)
