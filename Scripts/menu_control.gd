extends Control

@export var Main_game : PackedScene
# Called when the node enters the scene tree for the first time.
func GameBegin():
	var menu = load("res://Scenes/Main_game.tscn")
	var scene = menu.instantiate()
	get_parent().add_child(scene)
	queue_free()

func GameExit():
	get_tree().quit()
