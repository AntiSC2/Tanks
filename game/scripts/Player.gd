
extends RigidBody2D

var Active = false;
var Speed = 0.2;
var Gravity = 5;
var Power = 1000;
var SideSpeed = Vector2(8, 0);
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
		if (dir.x > 0):
			if (get_linear_velocity().x < SideSpeed.x):
				set_linear_velocity(get_linear_velocity() + SideSpeed);
			get_node("Wheel1").set_angular_velocity(get_node("Wheel1").get_angular_velocity() + Speed);
			get_node("Wheel2").set_angular_velocity(get_node("Wheel2").get_angular_velocity() + Speed);
		elif (dir.x < 0):
			if (get_linear_velocity().x > -SideSpeed.x):
				set_linear_velocity(get_linear_velocity() - SideSpeed);
			get_node("Wheel1").set_angular_velocity(get_node("Wheel1").get_angular_velocity() - Speed);
			get_node("Wheel2").set_angular_velocity(get_node("Wheel2").get_angular_velocity() - Speed);
	else:
		get_node("Wheel1").set_angular_velocity(0);
		get_node("Wheel2").set_angular_velocity(0);
		set_collision_mask_bit(1, true);
		dir = dir.normalized();

func _shoot():
	var turret = get_node("Turret");
	var bullet = preload("res://scenes/Bullet.tscn").instance();
	bullet.set_pos(get_pos());
	bullet.set_linear_velocity(Vector2(cos(turret.get_rot() + get_rot()), -sin(turret.get_rot() + get_rot())).normalized() * Power);
	get_parent().add_child(bullet);