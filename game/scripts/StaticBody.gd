
extends StaticBody2D

func _ready():
	set_fixed_process(true);

func _fixed_process(delta):
	if (get_node("TerrainPolygon").P == false):
		get_node("TerrainPolygon").P = true;
		var T = get_node("TerrainPolygon");
		var T1 = CollisionPolygon2D.new();
		T1.set_polygon(T.get_polygon());
		add_child(T1);
		add_shape(T1);