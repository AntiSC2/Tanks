
extends RigidBody2D

var Life = 3;

func _ready():
	get_node("/root/Global").Bullets.append(0);
	set_process(true);

func _process(delta):
	Life -= delta;
	if (Life < 0):
		get_node("/root/Global").Bullets.remove(get_node("/root/Global").Bullets.size() - 1);
		queue_free();