extends Node2D

var house_object = preload("res://house.tscn")

var farm_object = preload("res://Farm.tscn")

var factory_object = preload("res://Factory.tscn")

var hopsital_object = preload("res://hopsital.tscn")

var store_object = preload("res://store.tscn")

onready var population_count = $Camera2D/Control/Label

onready var food_count = $Camera2D/Control/Label2

onready var money_count = $Camera2D/Control/Label3

func _ready():
	Global.tilemap = $TileMap
	Global.money_current = 100000

func _process(_delta):
	population_count.text = "Current Population: " + str(Global.population_current) + " / " + str(Global.population_max)
	money_count.text = "Money: " + str(Global.money_current)
	food_count.text = "Food: " + str(Global.food_current)
	
func _on_Button_pressed():
	if Global.able_to_build == true && Global.money_current >= 350:
		var obj = house_object.instance()
		$YSort.add_child(obj)
		Global.money_current -= 250
		Global.able_to_build = false;

func _on_Button2_pressed():
	if Global.able_to_build == true && Global.money_current >= 475:
		var obj = farm_object.instance()
		$YSort.add_child(obj)
		Global.money_current -= 325
		Global.able_to_build = false;


func _on_Button3_pressed():
	if Global.able_to_build == true && Global.money_current >= 600:
		var obj = factory_object.instance()
		$YSort.add_child(obj)
		Global.money_current -= 450
		Global.able_to_build = false;

func _on_Button4_pressed():
	if Global.able_to_build == true && Global.money_current >= 1500:
		var obj = hopsital_object.instance()
		$YSort.add_child(obj)
		Global.money_current -= 1500
		Global.able_to_build = false;

func _on_Button5_pressed():
	if Global.able_to_build == true && Global.money_current >= 1750:
		var obj = store_object.instance()
		$YSort.add_child(obj)
		Global.money_current -= 1750
		Global.able_to_build = false;
