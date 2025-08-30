extends RigidBody2D

# Speed of the enemy (downward movement speed)
var min_speed = 50  # Minimum speed
var max_speed = 150  # Maximum speed
var speed = 0  # Will store the random speed value

func _ready():
	# Generate a random speed for this enemy
	speed = randf_range(min_speed, max_speed)
	
	# Set the initial downward velocity with the random speed
	linear_velocity = Vector2(0, speed)

func _process(delta):
	# Ensure the enemy is falling with the random speed
	linear_velocity.y = speed
