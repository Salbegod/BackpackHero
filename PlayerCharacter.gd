extends KinematicBody2D

export var speed := 200.0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(_delta):
	var input_vector := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var movement := input_vector.normalized()
	
	move_and_slide(speed * movement)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
