
extends StaticBody2D

var Points = 30;
var Polygon = Vector2Array([Vector2(1, 0)]);
var Processed = false;

func _ready():
	Polygon = get_node("Shape").get_polygon();
	set_process(true);

func _process(delta):
	update();

func _draw():
	for i in range(0, Polygon.size() - 1):
		draw_line(Polygon[i], Polygon[i + 1], Color(1, 0, 0, 1), 2);