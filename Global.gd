extends Node

var tilemap

var able_to_build = true

var hospital_built = false

var store_built = false

var population_current = 0

var population_max = 0

var money_current = 0

var food_current = 0

var hospital_current = 0

var store_amount = 0

var house_amount = 0

var factory_amount = 0

var farm_amount = 0

var thanos_snap_reduce = 0

var common_death = 0

var more_people = 0

var subside_food = 1

var faster_food = 0

onready var natural_death = $natural_death_timer

onready var population = $population_increase

onready var food = $food_decrease_pop

onready var starving = $pop_starving

func _ready():
	food.start(10)
	natural_death.start(10)

func _process(_delta):
	print(Global.population_max)
	if Global.food_current < 0 && starving.time_left == 0 && Global.population_current > 0: 
		starving.start(3)
	if Global.food_current > 0 && population.time_left == 0 && Global.population_current < Global.population_max:
		population.start(rand_range(5-more_people,13-(more_people*2)))
	if Global.hospital_built == true:
		thanos_snap_reduce += 14
		common_death = 30
		more_people = 3
	if Global.store_built == true:
		subside_food = 2
		faster_food = 4

func _on_population_increase_timeout():
	population_current += round(rand_range((1+round(house_amount/2)),(5+round(house_amount/2)))) + round(rand_range((1+round(farm_amount/2)),(3+round(farm_amount/2)))) + (hospital_current * 2)
	population.start(rand_range(5-more_people,13-(more_people*2)))

func _on_food_decrease_pop_timeout():
	Global.food_current -= round((round(population_current * 1.5) + round(Global.factory_amount * 1.5))/subside_food)
	food.start(10)

func _on_pop_starving_timeout():
	Global.population_current -= 1
	starving.start(3)


func _on_natural_death_timer_timeout():
	var dice_roll = round(rand_range(0,100))
	if (dice_roll > (30 + common_death) && Global.population_current > 5):
		if(dice_roll > (85 + thanos_snap_reduce) && Global.population_current > 10):
			Global.population_current -= round(Global.population_current*0.2)
		Global.population_current -= 1
	natural_death.start(10)
