extends CharacterBody2D

@export var bounce_strength = 2.0

# custom physics to simplify the bounce effect (no torque)
#func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:
	#for i in range(state.get_contact_count()):
		#var collision_normal = state.get_contact_local_normal(i)
		#var relative_velocity = state.get_contact_local_velocity_at_position(i) - state.get_linear_velocity()
		#var normal_velocity = relative_velocity.dot(collision_normal)
		#
		#if normal_velocity < 0:
			#var bounce_velocity = -bounce_strength * normal_velocity * collision_normal
			#state.set_linear_velocity(state.get_linear_velocity() + bounce_velocity)
