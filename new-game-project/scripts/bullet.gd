extends Area2D

@export var speed: float = 400.0
var direction: Vector2 = Vector2.RIGHT

func _physics_process(delta: float) -> void:
	position += direction * speed * delta

func _on_body_entered(body: Node) -> void:
	# Damage enemies, then remove bullet
	if body.is_in_group("enemies") and body.has_method("take_damage"):
		body.take_damage(1)
	queue_free()


func _on_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	pass # Replace with function body.
