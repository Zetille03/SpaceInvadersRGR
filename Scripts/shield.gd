extends Area2D

var numberlives: int = 1

func _ready() -> void:
	self.area_entered.connect(_on_area_entered)

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("Proyectil"):
		area.queue_free()
		queue_free()
