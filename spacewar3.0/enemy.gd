extends Area2D

var speed: int
var rotation_speed: int
var direction_x: float
func _ready():
	var rng:= RandomNumberGenerator.new()
# start position
	var width = get_viewport().get_visible_rect().size[0]
	var path: String = "res://graphics/EnemySprite/" + str(rng.randi_range(1, 2)) + ".png"
	$Sprite2D.texture = load(path)
	add_to_group("Enemy")
# print(width) just checking the size of the viewport window

	var random_x = rng.randi_range(0,width)
	var random_y = rng.randi_range(-150,-50)
	position = Vector2(random_x, random_y)
	# randomize meteor size
	var random_scale =randf_range(0.15,.5)
	scale = Vector2(random_scale,random_scale)
	# speed / rotation / direction randomizer
	speed =rng.randi_range(200,500)
	direction_x = rng.randf_range(-1,1)
func _process(delta):
	position += Vector2(direction_x, 1.0) * speed * delta
	rotation_degrees += rotation_speed * delta

func _on_body_entered(body):
	print('body entered')
	print(body)
	if body.is_in_group("player"):
			body.queue_free()
