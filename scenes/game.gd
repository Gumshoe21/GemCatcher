extends Node2D


@export var gem_scene: PackedScene

@onready var label: Label = $Label # drag/drop and hold Cmd

var _score: int = 0



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func spawn_gem() -> void:
	var new_gem: Gem = gem_scene.instantiate()
	var xpos: float = randf_range(70, 1050)
	new_gem.on_gem_off_screen.connect(game_over) #connedct game over function to on_gem_off_screen signal so that the func is invoked when the signal is emitted
	new_gem.position = Vector2(xpos, -50) # x, y
	add_child(new_gem)

func game_over() -> void:
	print("game_over")
	
func _on_timer_timeout() -> void:
	spawn_gem()


func _on_paddle_area_entered(area: Area2D) -> void:
	_score += 1
	label.text = "%05d" % _score # adds padding of 0's to score
	# label.text = str(_score) # convert to string
	area.queue_free()
