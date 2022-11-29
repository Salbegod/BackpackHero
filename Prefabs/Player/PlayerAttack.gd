extends Area

var strenght := 10





func _on_PlayerAttack_body_entered(body):
	body.takeDamage(strenght)


func _on_Timer_timeout():
	queue_free()
