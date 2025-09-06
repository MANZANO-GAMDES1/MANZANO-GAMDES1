extends Node2D
# 1. load the scene
var Enemy_scene: PackedScene = load("res://Enemy.tscn")
func _on_meteor_timer_timeout() -> void:
#2. create an instance
	var Enemy = Enemy_scene.instantiate()
#3. attach the node to the scene tree
	$Meteors.add_child(Enemy)
# print('peow! peow! peow! ') # Replace with function body.
