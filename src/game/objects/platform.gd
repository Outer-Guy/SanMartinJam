extends Area2D

export var run_speed = 20

signal platform_hit

func _physics_process(delta):
	var col = (run_speed * delta)
	translate(Vector2(delta*run_speed,0))
		
	
func _ready():
	pass
	
func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_start_game():
	queue_free()


func _on_Area2D_body_entered(body):
	if(body.name == "player"):
		emit_signal("platform_hit")
	pass # Replace with function body.
