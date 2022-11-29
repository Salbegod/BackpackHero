extends Node


export (String) var scene_name = "scene"

signal scene_changed(scene_name)

var scene_parameters := {
	
}

func load_scene_parameters(new_scene_parameters: Dictionary):
	scene_parameters = new_scene_parameters


func _on_PlayerCharacter_scene_changed(scene_name):
	emit_signal("scene_changed",scene_name)


