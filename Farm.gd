extends Sprite

onready var food_counter = $food_adder

func _ready():
	$Status.show()
	
func _process(_delta):
	var mouse_tile = Global.tilemap.world_to_map(get_global_mouse_position())
	
	var local_pos = Global.tilemap.map_to_world(mouse_tile)
	var world_pos = Global.tilemap.to_global(local_pos)
	
	global_position = world_pos

	if $Area2D.get_overlapping_areas().size() > 0:
		$Status.color = Color(255, 0, 0, 255)
	else:
		$Status.color = Color(0, 255, 0, 255)

func _unhandled_input(event):
	if event is InputEventMouseButton && event.pressed && event.button_index == BUTTON_LEFT &&  $Area2D.get_overlapping_areas().size() <= 0:
		Global.able_to_build = true
		functionality()
		$Status.hide()
		Global.farm_amount += 1
		set_process(false)
		set_process_unhandled_input(false)

func functionality():
	food_counter.start(8-Global.faster_food)

func _on_food_adder_timeout():
	Global.food_current += 2 + round(Global.population_current * 0.75) + round(Global.store_amount * 1.5)
	food_counter.start(8-Global.faster_food)
