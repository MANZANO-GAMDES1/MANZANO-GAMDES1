extends Node2D

var speed: float = 500

func _process(delta: float) -> void:
	position.y -= speed * delta
	
	if position.y < -10:
		queue_free()
		

func _on_area_entered(area: Area2D) -> void:
		if area.is_in_group("Enemy"):
			area.queue_free()
			queue_free()  # spaceship disappears
