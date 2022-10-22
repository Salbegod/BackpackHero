extends KinematicBody2D

export var speed := 200.0

onready var area2D := $Overworld/Area2DOverworld1


func _physics_process(_delta):
	var input_vector := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var movement := input_vector.normalized()
	
	#if(area2D._on_area2D_area_entered()):
	#	get_tree().change_scene("res://Scenes/3D/BeatEmUp_01.tscn")
	
	move_and_slide(speed * movement)


