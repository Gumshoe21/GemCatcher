extends Area2D

class_name Gem # gives this the class name of Gem

signal on_gem_off_screen
@export var speed: float = 100.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.y += speed * delta # 100px per second
	
	if position.y > get_viewport_rect().size.y:
		on_gem_off_screen.emit()
		set_process(false) # stop the process from being invoked any longer
		queue_free() # places request to Godot to remove scene from scene tree
