extends CharacterBody2D

class_name Player


@export var speed = 400
@export var bullet_timeout = 0.5
var is_alive: bool
var timeout_b = 0
var bulletscene: PackedScene
@onready var animation_player = $AnimationPlayer

signal player_destroyed

func _ready() -> void:
	bulletscene = preload("res://Scenes/bullet.tscn")
	is_alive = true

func get_input(delta):
	var input_direction = Vector2(Input.get_axis("left","right"),0)
	velocity = input_direction * speed
	if Input.is_action_just_pressed("shoot") && timeout_b<=0:
		timeout_b = bullet_timeout
		shoot()
	elif timeout_b>=0:
		timeout_b -= delta 

func shoot():
	print("shoot")
	if is_alive:
		var b = bulletscene.instantiate()
		get_tree().root.get_node("Main").add_child(b)
		b.transform = global_transform
	

func _physics_process(delta: float) -> void:
	get_input(delta)
	move_and_slide()
	


func on_player_destroyed():
	is_alive = false
	speed = 0
	animation_player.play("destroy")
	


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "destroy":
		await get_tree().create_timer(1).timeout
		player_destroyed.emit()
		queue_free()
