
extends Node

var Players = Array([]);
var Bullets = Array([]);
var PlayerTurnIndex = 0;
var Pressed = false;

func _ready():
	set_process(true);

func _process(delta):
	if (Input.is_action_pressed("NextTurn") && Pressed == false && Bullets.size() == 0):
		Pressed = true;
		Players[PlayerTurnIndex].Active = false;
		PlayerTurnIndex += 1;
		if (PlayerTurnIndex >= Players.size()):
			PlayerTurnIndex = 0;
		Players[PlayerTurnIndex].Active = true;
		Players[PlayerTurnIndex].Cooldown = 0;
	elif (Input.is_action_pressed("NextTurn") != true):
		Pressed = false;
	if (Players[PlayerTurnIndex].Cooldown == 1):
		Players[PlayerTurnIndex].Active = false;