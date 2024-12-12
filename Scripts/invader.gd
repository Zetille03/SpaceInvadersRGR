extends Area2D

class_name Invader

@onready var sprite_2d = $Sprite2D
@onready var animation_player = $AnimationPlayer

var config: Resource

func _ready() -> void:
	sprite_2d.texture= config.sprite
	animation_player.play(config.animation_name)


func _on_area_entered(area: Area2D) -> void:
	if area is Bullet:
		animation_player.play("destroy")


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if(anim_name == "destroy"):
		queue_free()
