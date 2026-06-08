extends Node2D

const SPEED = 60
var direction = 1

@onready var ray_cast_2d_right: RayCast2D = $RayCast2DRight
@onready var ray_cast_2d_left: RayCast2D = $RayCast2DLeft
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var timer: Timer = $Timer
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer






# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if ray_cast_2d_right.is_colliding():
		direction = -1
		animated_sprite_2d.flip_h = true
		
	if ray_cast_2d_left.is_colliding():
		direction = 1
		animated_sprite_2d.flip_h = false
	
	
	position.x +=  direction * SPEED * delta


func _on_area_2d_body_entered(body: Node2D) -> void:
		var y_delta = position.y - body.position.y
		
		if(y_delta > -10):
			audio_stream_player.play()
			queue_free()
			body.jumpenemydeath()
			
			
			
			
		else:
			print("u died")
			audio_stream_player.play()
			Engine.time_scale = 0.5
			body.get_node("CollisionShape2D").queue_free()
			timer.start()

func _on_timer_timeout() -> void:
	Engine.time_scale = 1.0
	get_tree().reload_current_scene()
