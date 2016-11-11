
extends RigidBody2D

var Life = 8;

func _ready():
	get_node("/root/Global").Bullets.append(0);
	set_process(true);

func _process(delta):
	Life -= delta;
	if (Life < 0):
		get_node("/root/Global").Bullets.remove(get_node("/root/Global").Bullets.size() - 1);
		queue_free();
	if (get_pos().x < 0):
		get_node("/root/Global").Bullets.remove(get_node("/root/Global").Bullets.size() - 1);
		queue_free();
	elif (get_pos().x > get_viewport_rect().size.x):
		get_node("/root/Global").Bullets.remove(get_node("/root/Global").Bullets.size() - 1);
		queue_free();