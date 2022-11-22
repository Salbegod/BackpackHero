extends KinematicBody

const SPEED := 1.5
const GRAVITY := 9.8

var motion := Vector3()
var animation := ""
var enable = false

onready var sprite : Sprite3D = get_node("Sprite3D")
onready var animator : AnimationPlayer = get_node("AnimationPlayer")
onready var speed := SPEED

signal scene_changed(scene_name)


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if not is_on_floor():
		motion.y -= GRAVITY * delta
		
	#chamar função para trocar personagem aqui
	if(Input.is_action_pressed("Char1")):
		enable = false
	if(Input.is_action_pressed("Char2")):
		enable = false
	if(Input.is_action_pressed("Char3")):
		enable = true
	
	if(enable):
		motion.x = Input.get_axis("ui_left", "ui_right") * speed
		motion.z = Input.get_axis("ui_up", "ui_down") * speed
		
		_flip()
		_animations()
	


	

func _physics_process(delta):
	if(enable):
		motion = move_and_slide(motion, Vector3.UP)

func _input(event):
	if(enable):
		if event.is_action_pressed("scene_switch"):
			emit_signal("scene_changed", "BeatEmUp")

func _flip() -> void:
	if(enable):
		if motion.x != 0:
			sprite.flip_h = false if motion.x > 0 else true

func _animations() -> void:
	
	#if is_on_floor():
	if motion.x != 0 or motion.z != 0:
		_set_animation("Walk")
	else:
		_set_animation("Idle")
	
func _set_animation(anim: String) -> void:
	
	if animation != anim:
		animation = anim
		animator.play(animation)
