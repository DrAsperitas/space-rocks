extends Node
class_name Main

const Ufo = preload("res://UFO/UFO.tscn")
const ROCK = preload("res://Rock/Rock.tscn")
const PLAYER_UI = preload("res://PlayerUI/PlayerUI.tscn")

@onready var pause_menu: PauseMenu = $PauseMenu
@onready var ufo_timer: Timer = $UFOTimer

var players: Array[PlayerUI]
var rock_count: int = 3

func _ready() -> void:
	ufo_timer.timeout.connect(on_ufo_spawn)
	#spawn_player()
	#spawn_rocks(6)

func spawn_rocks():
	for r in rock_count:
		var rock = ROCK.instantiate()
		rock.main = self
		add_child(rock)

func spawn_player():
	var player = PLAYER_UI.instantiate()
	player.main = self
	add_child(player)
	players.append(player)

func on_ufo_spawn():
	var ufo : UFO = Ufo.instantiate()
	if randi() % 2:
		ufo.position.x = 0
	else:
		ufo.position.x = get_viewport().size.x
	ufo.position.y  = randf_range(0.0, get_viewport().size.y )
	add_child(ufo)



func just_scored(delta_score, _player):
	players[0].update_score(delta_score)
	

func start_new_round():
	pass

func game_over():
	pass
