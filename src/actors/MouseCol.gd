extends Area2D

func _process(delta):
	position = get_global_mouse_position()
	GameData.mousePos = position

func onAreaEntered(area):
	area.mouseDetection(true)

func onAreaExited(area):
	area.mouseDetection(false)
