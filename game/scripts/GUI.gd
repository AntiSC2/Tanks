
extends Control

func _ready():
	get_node("/root/Global").Paused = true;
	get_node("NameInput").popup();
	set_process(true);

func _process(delta):
	set_size(Vector2(OS.get_window_size().x, 720));
	update();

func _draw():
	var g = get_node("/root/Global");
	draw_string(preload("res://fonts/Default.fnt"), Vector2(4, 24), "Angle: " + var2str(stepify(rad2deg(g.Players[g.PlayerTurnIndex].get_node("Turret").get_rot()), 0.1)), Color(0, 0, 0, 1));
	draw_string(preload("res://fonts/Default.fnt"), Vector2(4, 48), "Power: " + var2str(stepify(g.Players[g.PlayerTurnIndex].PowerMod * 100, 0.1)), Color(0, 0, 0, 1));
	draw_string(preload("res://fonts/Default.fnt"), Vector2(4, 72), "Health: " + var2str(stepify(g.Players[g.PlayerTurnIndex].Health, 0.1)), Color(0, 0, 0, 1));
	draw_string(preload("res://fonts/Default.fnt"), Vector2(4, 120), "Name: " + g.Players[g.PlayerTurnIndex].Name, Color(0, 0, 0, 1));
	draw_string(preload("res://fonts/Default.fnt"), Vector2(4, 96), "Fuel: " + var2str(stepify(g.Players[g.PlayerTurnIndex].Fuel, 0.1)), Color(0, 0, 0, 1));