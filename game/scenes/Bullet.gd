
extends RigidBody2D

var Life = 3;

func _ready():
	get_node("/root/Global").Bullets = true;
	set_process(true);

func _process(delta):
	Life -= delta;
	if (Life < 0):
		queue_free();