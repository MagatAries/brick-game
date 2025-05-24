extends Area2D


#this function checks for if anything enters the area for the brick
func _on_body_entered(body: Node2D) -> void:
	if body.name == "Ball":
		print(global_position)
		print("ball, ", body.global_position)
		print("pre-norm ",body.global_position - global_position)
		print("norm ",(body.global_position - global_position).normalized())
		var hit_direction = (body.global_position - global_position).normalized()
		
		if abs(hit_direction.x) > abs(hit_direction.y):
			body.linear_velocity.x *= -1  # Side hit → flip X
		else:
			body.linear_velocity.y *= -1  # Top/bottom hit → flip Y
		queue_free()
		##increment score
