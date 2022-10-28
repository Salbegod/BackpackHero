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

	next_scene = load("res://" + next_scene_name + ".tscn").instance()
	next_scene.layer = -1
	add_child(next_scene)
	next_scene.connect("scene_changed", self, "handle_scene_change")
	transfer_data_between_scenes(current_scene, next_scene)


func transfer_data_between_scenes(old_scene, new_scene):
	new_scene.load_level_parameters(old_scene.level_parameters)
