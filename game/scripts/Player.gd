
extends KinematicBody2D

var Speed = 200;
var Gravity = 5;
var GravityD = 0;
var GravityDirection = Vector2(0, 1);

func _ready():
	set_fixed_process(true);

func _fixed_process(delta):
	GravityD += Gravity;
	var dir = Vector2(0, 0);
	if (Input.is_action_pressed("Right")):
		dir.x += 1;
	elif (Input.is_action_pressed("Left")):
		dir.x -= 1;
	
	var motion = move(dir * Speed * delta + (GravityD * GravityDirection * delta));
	if (is_colliding()):
		GravityD = 0;
		var n = get_collision_normal();
		set_rot(atan2(n.x, n.y));
		motion = n.slide(motion);
		if (dir.x != 0):
			move(motion);