extends Area2D

# Speed of the spaceship
var speed = 200  # Adjust this value to control the speed

func _process(delta):
	var direction = Vector2.ZERO
	
	# Check for input and assign direction based on the arrow keys
	if Input.is_action_pressed("ui_left") or Input.is_action_pressed("left"):
		direction.x -= 1  # Move left
	if Input.is_action_pressed("ui_right") or Input.is_action_pressed("right"):
		direction.x += 1  # Move right
	if Input.is_action_pressed("ui_up") or Input.is_action_pressed("up"):
		direction.y -= 1  # Move up
	if Input.is_action_pressed("ui_down") or Input.is_action_pressed("down"):
		direction.y += 1  # Move down

	# Normalize the direction vector to maintain consistent speed in all directions
	direction = direction.normalized()

	# Update position based on the direction
	position += direction * speed * delta
