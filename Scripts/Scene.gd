extends Node


signal scene_changed(scene_name)

export (String) var scene_name = "scene"

var scene_parameters := {
	
}


func load_scene_parameters(new_scene_parameters: Dictionary):
	scene_parameters = new_scene_parameters

func _process(delta):
	if (Input.is_physical_key_pressed(KEY_E)):
		emit_signal("scene_changed", scene_name)
