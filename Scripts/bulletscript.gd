extends Area2D

@export var speed = 750

func _physics_process(delta):
	position -= transform.y * speed * delta


func _on_area_entered(area: Area2D) -> void:
	queue_free()
