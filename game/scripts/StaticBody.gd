
extends StaticBody2D

func _ready():
	set_fixed_process(true);

func _fixed_process(delta):
	if (get_node("TerrainPolygon").P == false):
		get_node("TerrainPolygon").P = true;
		clear_shapes();
		var T = get_node("TerrainPolygon");
		add_shape(T);