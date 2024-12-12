extends CanvasLayer

class_name UI

@onready var points_label = $LabelScore
@onready var points_counter = $"../ContadorPuntos" as ContadorPuntos
@onready var lifes_label = $LabelLifes
@onready var gamestate_panel = $GameStatePanel
@onready var gamestate_label = $GameStatePanel/Label

@export var invader_spawner: InvaderSpawner
@export var vida_manager: VidaManager

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	gamestate_panel.visible = false

	points_label.text = "PUNTUACIÓN: %d" % 0
	points_counter.on_points_increased.connect(points_increased)
	vida_manager.life_lost.connect(on_life_lost)
	
	invader_spawner.game_lose.connect(on_game_lost)
	invader_spawner.game_won.connect(on_game_won)
	
	var lifes_count = vida_manager.lifes
	lifes_label.text = "Vidas: %d" % lifes_count
	
func points_increased(points:int):
	points_label.text = "PUNTUACIÓN: %d" % points


func on_life_lost(lives_left:int):
	if lives_left != 0:
		lifes_label.text = "Vidas: %d" % lives_left
	else:
		on_game_lost()

func on_game_lost():
	gamestate_label.text = "PERDISTE"
	gamestate_panel.visible = true
	
func on_game_won():
	gamestate_label.text = "GANASTE!!"
	gamestate_panel.visible = true

func _on_restart_button_pressed() -> void:
	get_tree().reload_current_scene()
