extends Node2D

onready var player := $Player
onready var area2D := $Overworld/Area2DOverworld1

func _physics_process(delta: float) -> void:
	if(area2D._on_area2D_area_entered()):
		get_tree().change_scene("res://Scenes/3D/BeatEmUp_01.tscn")
