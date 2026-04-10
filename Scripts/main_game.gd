extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var BallNum = get_tree().get_nodes_in_group("ball")
	if BallNum.is_empty():
		var menu = load("res://Scenes/Menu.tscn")
		var scene = menu.instantiate()
		get_parent().add_child(scene)
		queue_free()
