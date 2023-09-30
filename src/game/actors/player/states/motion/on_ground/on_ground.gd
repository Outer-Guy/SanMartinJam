extends "../motion.gd"

var speed

func handle_input(event):
	if event.is_action_pressed("ui_up"):
		emit_signal("finished", "jumping")
	return .handle_input(event)


func update(delta):
	return .update(delta)
