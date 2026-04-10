extends StaticBody2D

var Drop_change := 0.1
@export var doubleball : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group("bricks") 

func die():
	if randf() < Drop_change:
		var db = doubleball.instantiate()
		db.global_position = global_position
		get_node("../../PowerBall").add_child(db)
	queue_free()
