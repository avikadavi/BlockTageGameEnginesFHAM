extends Control

var countCoins: Label
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	countCoins = $HBoxContainer/Label2
	SetText("0")
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func SetText(newText: String):
	countCoins.text = newText
