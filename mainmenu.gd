extends Control


func _on_play_pressed():
	get_tree().change_scene_to_file("res://node_2d.tscn")
	pass # Replace with function body.


func _on_options_pressed():
	pass # Replace with function body.



func _on_quit_pressed():
	get_tree().quit(0)
	pass # Replace with function body.
