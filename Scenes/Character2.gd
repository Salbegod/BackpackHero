extends KinematicBody

const SPEED := 1.5
const GRAVITY := 9.8
const ATTACK := preload("res://Prefabs/Player/PlayerAttack.tscn")

var motion := Vector3()
var animation := ""
var enable = false

onready var sprite : Sprite3D = get_node("Sprite3D")
onready var animator : AnimationPlayer = get_node("AnimationPlayer")
onready var speed := SPEED


var timer := 0.5
var cooldown := 1.6
var attacking := false

signal scene_changed(scene_name)



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
		enable = true
	if(Input.is_action_pressed("Char3")):
		enable = false
	
	if(enable):
		motion.x = Input.get_axis("ui_left", "ui_right") * speed
		motion.z = Input.get_axis("ui_up", "ui_down") * speed
		
		if Input.is_action_just_pressed("ui_attack") and timer > 0.3:
			attacking = true
			timer = 0
			
		
		_flip()
	_animations(delta)
	
	


	

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

func _animations(delta: float) -> void:
	#if is_on_floor():
	if attacking:
		_set_animation("Attack")
		timer += delta
		if timer >= cooldown:
			attacking = false
	else:
		if motion.x != 0 or motion.z != 0:
			_set_animation("Walk")
		else:
			_set_animation("Idle")
	
func _set_animation(anim: String) -> void:
	
	if animation != anim:
		animation = anim
		animator.play(animation)

func player_attack(damage: int) -> void:
	var attk = ATTACK.instance()
	attk.strenght = damage
	get_parent().add_child(attk)
	attk.transform.origin = get_node("Attack/Spawn").global_transform.origin
	
