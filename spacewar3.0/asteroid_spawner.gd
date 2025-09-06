extends Node2D

@export var asteroid_scene: PackedScene
@export var spawn_interval: float = 3

var timer: Timer

func _ready() -> void:
	timer = Timer.new()
	timer.wait_time = spawn_interval
	timer.autostart = true
	timer.timeout.connect(spawn_asteroid)
	add_child(timer)

func spawn_asteroid() -> void:
	var asteroid = asteroid_scene.instantiate()
	add_child(asteroid)
