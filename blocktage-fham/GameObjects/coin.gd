extends Node3D

@export var rotationspeed := 1.0


var up := true
var bigger := true

var collected := false

signal CoinCollectedSignal

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group("Coin")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	rotate_y(delta * randi_range(1,3) * rotationspeed)
	
	#CoinsUpAndDown(delta)
	#ScaleCoins(delta)
	
func ScaleCoins(delta) -> void:
	
	if bigger:
		scale += Vector3(0.3, 0.3, 0.3) * delta
	else:
		scale -= Vector3(0.3, 0.3, 0.3) * delta
		
	if scale.length() > 3:
		bigger = false
	elif scale.length() < 1:
		bigger = true
		
func CoinsUpAndDown(delta) -> void:
	
	if up and position.y < 2:
		position += Vector3(0, 0.3, 0) * delta 
	else:
		position -= Vector3(0, 0.3, 0) * delta
	
	if position.y > 2:
		up = false
		
	if position.y < 0:
		up = true

func _on_area_3d_body_entered(body: Node3D) -> void:
	if(body.is_in_group("Player")):
		FireCoinCollected()
		queue_free()

func FireCoinCollected() -> void:
	CoinCollectedSignal.emit(self)


	
