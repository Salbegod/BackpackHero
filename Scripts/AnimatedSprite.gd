extends AnimatedSprite

func _ready():
	pass

func _physics_process(_delta):
	var input_vector := Input.get_vector("ui_left", "ui_right", "ui_down", "ui_up")
	
	if input_vector == Vector2.ZERO:
		$AnimationTree.get("parameters/playback").travel("idle")
	else:
		$AnimationTree.get("parameters/playback").travel("walk")
		$AnimationTree.set("parameters/idle/blend_position", input_vector)
		$AnimationTree.set("parameters/walk/blend_position", input_vector)
