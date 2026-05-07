extends CharacterBody3D

const SPEED = 5.0
const JUMP_VELOCITY = 4.5
const ROTATION_SPEED = 3.0

func _ready() -> void:
	position = $"../Startposition".position

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
		$AnimationPlayer.play("fall")

	if Input.is_action_just_pressed("move_jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# A / D rotieren den Player
	var turn_input := Input.get_axis("move_right", "move_left")
	rotate_y(turn_input * ROTATION_SPEED * delta)

	# W / S bewegen vor/zurück relativ zur Player-Rotation
	var move_input := Input.get_axis("move_forward", "move_backward")
	var direction := -transform.basis.z * move_input

	if direction != Vector3.ZERO:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	if direction != Vector3.ZERO and is_on_floor():
		$AnimationPlayer.play("walk")
	elif is_on_floor():
		$AnimationPlayer.play("idle")
		
	if CheckIfDead():
		position = $"../Startposition".position
	
	move_and_slide()

	
func CheckIfDead() -> bool:
	if position.y < -1:
		print("Spieler ist Tot")
		return true
	return false
