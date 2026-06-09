extends AnimatableBody2D

var direction = 1
const SPEED = 60
@onready var ray_cast_2_dright: RayCast2D = $RayCast2Dright
@onready var ray_cast_2_dleft: RayCast2D = $RayCast2Dleft


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if ray_cast_2_dleft.is_colliding():
		direction = 1
		
		
	if ray_cast_2_dright.is_colliding():
		direction = -1
	
	position.x +=  direction * SPEED * delta
