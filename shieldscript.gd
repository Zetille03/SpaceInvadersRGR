extends Area2D

@export var numberlives: int


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("Proyectil"):
		numberlives -= 1
		if numberlives<=0:
			queue_free()
