extends RigidBody2D

@export var speed := 225
var screen_size
var is_resetting
var reset_target_position := Vector2.ZERO
var reset_target_velocity := Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = get_viewport_rect().size
	linear_velocity = Vector2(randf_range(0.5,0.8),-randf_range(0.5,0.8))
	

func _integrate_forces(state: PhysicsDirectBodyState2D) -> void: 
	if is_resetting:
		#state.transform is the full 2D transform of the body: its position, rotation, and scale.
		state.transform.origin = reset_target_position
		#“Hey physics system, here’s your updated truth. Forget whatever momentum you had — this is where the body is now.”
		state.linear_velocity = reset_target_velocity
		return

	if linear_velocity.length() != speed:
		##fix velocity where y slows down and never changes
		##fix velocity where x slows down and never changes
		linear_velocity = linear_velocity.normalized() * speed
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_body_entered(body: Node) -> void:
	print("entered ", body.name)
	if body.name == "WallBot":
		_on_lost()	
	
func _on_lost() -> void:
	##save score
	is_resetting = true
	reset_target_position = Vector2(135, 420)
	reset_target_velocity = Vector2(linear_velocity)
	hide()
	await get_tree().create_timer(0.8).timeout
	show()
	await get_tree().process_frame
	await get_tree().process_frame
	is_resetting = false
	pass
