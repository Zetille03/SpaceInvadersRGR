extends Area2D

class_name InvaderShot

@export var speed = 200


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.y += speed * delta


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()


func _on_body_entered(body: Node2D) -> void:
	if(body is Player):
		(body as Player).on_player_destroyed()
		queue_free()
