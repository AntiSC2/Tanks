
extends CollisionPolygon2D

var Points = 30;
var A = Vector2Array([Vector2(1, 0), Vector2(0, 1)]);
var P = false;

func _ready():
	randomize();
	A.remove(1);
	A.remove(0);
	var xsize = 1280 / (Points - 1);
	for i in range(0, Points):
		var s = Vector2(xsize * i, rand_range(620, 400));
		A.append(s);
	A.append(Vector2(1300, 800));
	A.append(Vector2(700, 800));
	A.append(Vector2(-100, 800));
	set_polygon(A);
	set_process(true);

func _process(delta):
	update();

func _draw():
	var array = get_polygon();
	for i in range(0, array.size() - 1):
		draw_line(array[i], array[i + 1], Color(1, 1, 1, 1), 4);