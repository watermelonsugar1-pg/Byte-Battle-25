extends CharacterBody2D

@export var max_health: int = 3
var health: int

func _ready() -> void:
	health = max_health

func take_damage(amount: int) -> void:
	health -= amount
	print("Enemy hit! HP:", health)
	if health <= 0:
		die()

func die() -> void:
	# Play animation, sound, etc. if you want, then:
	queue_free()
