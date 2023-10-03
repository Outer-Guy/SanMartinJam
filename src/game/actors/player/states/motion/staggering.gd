extends "motion.gd"

func enter():
	anim_player.play("stagger")

func _on_animation_finished(anim_name):
	emit_signal("finished", "falling")
	get_tree().change_scene("res://Scenes/GameOver.tscn")

func exit():
	pass
