extends AnimatedSprite

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(_delta):
	var input_vector := Input.get_vector("ui_left", "ui_right", "ui_down", "ui_up")
	
	if input_vector == Vector2.ZERO:
		$AnimationTree.get("parameters/playback").travel("idle")
	else:
		$AnimationTree.get("parameters/playback").travel("walk")
		$AnimationTree.set("parameters/idle/blend_position", input_vector)
		$AnimationTree.set("parameters/walk/blend_position", input_vector)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
