extends CharacterBody2D

# Exported variable for easy adjustment in the editor
@export var speed: int = 500

# Screen dimensions
var screen_width: int = 1120	
var screen_height: int = 600

# Laser variables
var laser_scene = preload("res://Laser.tscn")
var laser_cooldown: float = 0.2
var last_shot_time: float = 0.0


func _ready():
	position = Vector2(0,600)
	scale = Vector2(1,1)

func _process(delta):
	# Get input vector (WASD/arrow keys must be mapped in InputMap: "left","right","up","down")
	var direction = Vector2.ZERO

	if Input.is_action_pressed("ui_right") or Input.is_action_pressed("right"):
		direction.x += 1
	if Input.is_action_pressed("ui_left") or Input.is_action_pressed("left"):
		direction.x -= 1
	if Input.is_action_pressed("ui_down") or Input.is_action_pressed("down"):
		direction.y += 1
	if Input.is_action_pressed("ui_up") or Input.is_action_pressed("up"):
		direction.y -= 1

	velocity = direction.normalized() * speed
	move_and_slide()

	# Clamp ship inside screen
	position.x = clamp(position.x, 0, screen_width)
	position.y = clamp(position.y, 0, screen_height)

	# Fire laser with cooldown
	last_shot_time += delta
	if Input.is_action_pressed("ui_accept") and last_shot_time >= laser_cooldown:
		fire_laser()

func fire_laser():
	
	last_shot_time = 0.0
		
	if laser_scene == null:
		print_debug("Laser scene failed to load!")
		return

	var laser = preload("res://Laser.tscn").instantiate()
	laser.position = position + Vector2(0, -20)
	get_parent().add_child(laser)
	if laser == null:
		print_debug("Failed to instantiate laser!")
		return

	# Start laser just above the ship
	laser.position = position + Vector2(0, -20)
	get_parent().add_child(laser)
	print_debug("Laser fired at position: ", laser.position)

	# Optional: connect to cleanup if bullet goes off-screen
	laser.connect("tree_entered", Callable(self, "_on_laser_entered"))

# Cleanup when laser leaves screen
func _on_laser_entered():
	for child in get_parent().get_children():
		if child.name == "Laser" and (child.position.y < 0 or child.position.y > screen_height):
			child.queue_free()
