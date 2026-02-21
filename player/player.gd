extends CharacterBody2D
signal health_changed(new_health: int)
signal damaged

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var health: int = 100

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

""" Metodo que toma daño. """
func take_damage(amount):
	health -= amount
	health = clamp(health, 0, 100)
	emit_signal("health_changed", health)
	emit_signal("damaged")
	print("Vida:", health)
	
	if health <= 0:
		die()

func die():
	print("Putamente Muerto!")
	queue_free()
