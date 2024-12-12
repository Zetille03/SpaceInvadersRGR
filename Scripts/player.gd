extends CharacterBody2D

class_name Player

@export var speed = 400
@export var bullet_timeout = 0.5
var timeout_b = 0
@export var bulletscene: PackedScene
@export var min_x = -500
@export var max_x = 500 

@onready var animation_player = $AnimationPlayer

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
	var b = bulletscene.instantiate()
	owner.add_child(b)
	b.transform = global_transform
	

func _physics_process(delta: float) -> void:
	get_input(delta)
	move_and_slide()
	
	if position.x < min_x:
		position.x = min_x
	elif position.x > max_x:
		position.x = max_x


func on_player_destroyed():
	speed = 0
	animation_player.play("destroy")
	
