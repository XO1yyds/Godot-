extends Node

var loaded_scenes = {}

func get_or_load(path: String) -> Node:
	if not loaded_scenes.has(path):
		var sc = load(path)
		loaded_scenes[path] = sc.instantiate()
	return loaded_scenes[path]

func show_scene(path: String):
	var node = get_or_load(path)
	get_tree().root.add_child(node)
	print("show" , loaded_scenes)

func hide_scene(path: String):
	if loaded_scenes.has(path):
		loaded_scenes[path].get_parent().remove_child(loaded_scenes[path])
		print("hide" , loaded_scenes)
