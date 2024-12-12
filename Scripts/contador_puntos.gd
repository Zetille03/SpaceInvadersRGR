extends Node

class_name ContadorPuntos

signal on_points_increased(points: int)

var points: int = 0

@onready var invader_spawner_scene = $"../InvaderSpawner" as InvaderSpawner

func _ready() -> void:
	invader_spawner_scene.invader_destroyed.connect(increase_points)
	
func increase_points(points_to_add: int):
	points+=points_to_add
	on_points_increased.emit(points)
