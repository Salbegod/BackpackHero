extends KinematicBody

const GRAVITY := 9.8

export(int) var speed_default := 50

var motion := Vector3()
var death := false
var walk_timer := 0.0
var x_direction := 0.0
var z_direction := 0.0

var animation := ""
var facing_right = false

onready var sprite : Sprite3D = get_node("Sprite3D")
onready var animator : AnimationPlayer = get_node("AnimationPlayer")
onready var speed := speed_default
onready var player : KinematicBody = get_parent().get_node("PlayerCharacter1")




# Called when the node enters the scene tree for the first time.
func _ready():
	randomize() # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	motion.y -= GRAVITY * delta
	
	_movement(delta)
	_animations()
	_flip()
	
	
		

func _physics_process(delta):
	motion = move_and_slide(motion, Vector3.UP)


func _movement(delta) -> void:
	if(not death):
		var target_distance = player.transform.origin - transform.origin
		x_direction = target_distance.x / abs(target_distance.x)
		walk_timer += delta
		if walk_timer > rand_range(1,2):
			z_direction = randi() % 3 - 1
			walk_timer = 0
		if abs(target_distance.x) < 1:
			x_direction = 0
			
		motion = Vector3(x_direction, 0, z_direction)
		


func _flip() -> void:
	facing_right = true if player.transform.origin.x > transform.origin.x else false
	if facing_right:
		sprite.flip_h = true
	else:
		sprite.flip_h = false
	


func _animations() -> void:
	_set_animation("Idle")
		
	
func _set_animation(anim: String) -> void:
	
	if animation != anim:
		animation = anim
		animator.play(animation)
