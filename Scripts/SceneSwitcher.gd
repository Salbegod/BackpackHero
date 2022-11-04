extends Node


var next_scene = null

onready var current_scene = $Overworld


func _ready() -> void:
	current_scene.connect("scene_changed", self, "handle_scene_change")


func handle_scene_change(current_scene_name: String):
	var next_scene_name: String

	match current_scene_name:
		"Overworld":
			next_scene_name = "BeatEmUp"
		"BeatEmUp":
			next_scene_name = "Overworld"
		_:
			return

	var level = get_node(current_scene_name)
	remove_child(level)
#	level.call_deferred("free")

	next_scene = load("res://Scenes/" + next_scene_name + ".tscn").instance()
	add_child(next_scene)
	next_scene.connect("scene_changed", self, "handle_scene_change")
	transfer_data_between_scenes(current_scene, next_scene)


func transfer_data_between_scenes(old_scene, new_scene):
	new_scene.load_scene_parameters(old_scene.scene_parameters)


func _on_Overworld_scene_changed(scene_name):
	handle_scene_change(scene_name)
