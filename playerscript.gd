extends CharacterBody2D

@export var speed = 400
@export var bulletscene: PackedScene

func get_input():
	var input_direction = Vector2(Input.get_axis("left","right"),0)
	velocity = input_direction * speed
	if Input.is_action_just_pressed("shoot"):
		shoot()

func shoot():
	var b = bulletscene.instantiate()
	owner.add_child(b)
	b.transform = global_transform
	

func _physics_process(delta: float) -> void:
	get_input()
	move_and_slide()
