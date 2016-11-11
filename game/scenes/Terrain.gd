
extends StaticBody2D

var Update = true;

func _ready():
	set_process(true);

func _process(delta):
	if (Update == true):
		var texture = get_node("Bitmap").get_texture();
		var data = texture.get_data();
		data.get_data()
		for i in range(640, 1280):
			for y in range(300, 720):
				data.put_pixel(i, y, Color(0, 0, 0, 0));
		texture.set_data(data);
		Update = false;