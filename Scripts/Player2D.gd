extends KinematicBody2D

export var speed := 200.0

var walk_timer := 0.0
var chance := 0

signal scene_changed(scene_name)

func _physics_process(_delta):
	var input_vector := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var movement := input_vector.normalized()
	
	move_and_slide(speed * movement)
	if (movement != Vector2.ZERO):
		_randomEncounter(_delta)
	

func _randomEncounter(delta) -> void:
	
	walk_timer += delta
	if walk_timer > rand_range(2,5):
		chance = rand_range(0, 100)
		if chance <= 50:
			  emit_signal("scene_changed", "Overworld")
		
		walk_timer = 0
		

func _input(event):
	if event.is_action_pressed("scene_switch"):
		emit_signal("scene_changed", "Overworld")
