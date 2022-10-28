extends KinematicBody2D

export var speed := 200.0

func _physics_process(_delta):
	var input_vector := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var movement := input_vector.normalized()
	
	move_and_slide(speed * movement)

func _process(delta):
	if (Input.is_physical_key_pressed(KEY_E)):
		
		pass
