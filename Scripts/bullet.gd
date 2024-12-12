extends Area2D

class_name Bullet 

@export var speed = 750

func _physics_process(delta):
	position -= transform.y * speed * delta


func _on_area_entered(area: Area2D) -> void:
	if(area is InvaderShot):
		area.queue_free()
	queue_free()
	
