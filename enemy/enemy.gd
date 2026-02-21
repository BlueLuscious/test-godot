extends CharacterBody2D

@export var speed: float = 100.0
@export var damage: int = 10

var player = null

func _physics_process(delta):
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	if player:
		var direction = player.global_position.x - global_position.x
		velocity.x = sign(direction) * speed
	else:
		velocity.x = 0
		
	move_and_slide()

func _on_attack_area_body_entered(body: CharacterBody2D):
	if body.is_in_group("player"):
		print("Estoy atacando al jugador")
		player = body
		player.take_damage(10)
