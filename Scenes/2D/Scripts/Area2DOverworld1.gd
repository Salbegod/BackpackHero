extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#if()

func _on_area2D_area_entered(_area) -> bool:
	return true
	


func _on_Area2DOverworld1_area_entered(_area) -> void:
	get_tree().change_scene("res://Scenes/3D/BeatEmUp_01.tscn")
	
