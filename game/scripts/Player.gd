
extends KinematicBody2D

var Active = false;
var Speed = 50;
var Gravity = 5;
var Power = 1000;
var GravityDelta = 0;
var TurretRotate = 0.05;
var Cooldown = 0;
var GravityDirection = Vector2(0, 1);

func _ready():
	get_node("/root/Global").Players.append(self);
	print(get_node("/root/Global").Players.size());
	set_fixed_process(true);

func _fixed_process(delta):
	get_node("Arrow").set_hidden(!Active);
	GravityDelta += Gravity;
	var turret = get_node("Turret");
	var dir = Vector2(0, 0);
	if (Active == true):
		set_collision_mask_bit(1, false);
		if (Input.is_action_pressed("Right")):
			dir.x += 1;
		elif (Input.is_action_pressed("Left")):
			dir.x -= 1;
		if (Input.is_action_pressed("Up")):
			turret.set_rot(turret.get_rot() + TurretRotate);
			if (rad2deg(turret.get_rot()) > 180):
				turret.set_rot(deg2rad(180));
		elif (Input.is_action_pressed("Down")):
			turret.set_rot(turret.get_rot() - TurretRotate);
			if (rad2deg(turret.get_rot()) < 0):
				turret.set_rot(0);
		if (Input.is_action_pressed("Fire") && Cooldown == 0):
			Cooldown = 1
			_shoot();
	else:
		set_collision_mask_bit(1, true);
	
	var motion = move(dir * Speed * delta + (GravityDelta * GravityDirection * delta));
	if (is_colliding()):
		GravityDelta = 0;
		var n = get_collision_normal();
		motion = n.slide(motion);
		var r = motion.normalized();
		set_rot(atan2(-n.x, -n.y));
		if (dir != Vector2(0, 0)):
			move(motion);

func _shoot():
	var turret = get_node("Turret");
	var bullet = preload("res://scenes/Bullet.tscn").instance();
	bullet.set_pos(get_pos());
	bullet.set_linear_velocity(Vector2(cos(turret.get_rot() + get_rot()), -sin(turret.get_rot() + get_rot())).normalized() * Power);
	get_parent().add_child(bullet);