extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export (Color,RGB) var text_color

func _pressed():
	get_tree().quit()
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	pass # Replace with function body.
