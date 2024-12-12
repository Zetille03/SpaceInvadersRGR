extends Area2D

func _ready() -> void:
	self.area_entered.connect(_on_area_entered)

func _on_area_entered(area: Area2D) -> void:
	if area is Invader:
		queue_free()
