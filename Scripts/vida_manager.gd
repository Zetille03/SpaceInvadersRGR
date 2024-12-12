extends Node

class_name VidaManager

signal life_lost(lifes_left: int)

@export var lifes = 3
@export var bottom_wall: Area2D
@onready var player: Player = $"../Player"

var player_scene = preload("res://Scenes/player.tscn")

func _ready() -> void:
	(player as Player).player_destroyed.connect(_on_player_destroyed)
	
func _on_player_destroyed():
	lifes -= 1
	life_lost.emit(lifes)
	if lifes != 0:
		player = player_scene.instantiate() as Player
		player.global_position = bottom_wall.global_position
		player.player_destroyed.connect(_on_player_destroyed)
		get_tree().root.get_node("Main").add_child(player)
