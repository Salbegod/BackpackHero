extends Node


signal scene_changed(scene_name)

export (String) var scene_name = "scene"

var scene_parameters := {
	
}


func load_scene_parameters(new_scene_parameters: Dictionary):
	scene_parameters = new_scene_parameters


func set_clicks(new_click_amount: int):
	scene_parameters.clicks = new_click_amount


func _on_ChangeSceneButton_pressed() -> void:
	emit_signal("scene_changed", scene_name)


func _on_ClickButton_pressed() -> void:
	set_clicks(scene_parameters.clicks + 1)
