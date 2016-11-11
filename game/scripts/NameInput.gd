
extends PopupMenu

# member variables here, example:
# var a=2
# var b="textvar"

var PlayerIndex = 0;
var Pressed = false;

func _ready():
	set_process(true);

func _process(delta):
	if (Input.is_action_pressed("NextTurn") && PlayerIndex < get_node("/root/Global").Players.size() && Pressed == false):
		get_node("/root/Global").Players[PlayerIndex].Name = get_node("Input").get_text();
		get_node("Input").set_text("");
		get_node("Text").set_bbcode("Enter name for Player " + var2str(PlayerIndex + 2) + ":");
		PlayerIndex += 1;
		Pressed = true;
	elif (PlayerIndex >= get_node("/root/Global").Players.size()):
		set_hidden(true);
	if (Input.is_action_pressed("NextTurn") == false):
		Pressed = false;

func _on_NameInput_popup_hide():
	get_node("/root/Global").Paused = false;
