extends Node3D


@export var Coins: Array
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Coins = get_tree().get_nodes_in_group("Coin")

	for coin in Coins:
		print(coin)
		coin.CoinCollectedSignal.connect(onCoinCollected)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func onCoinCollected() -> void:
	print("CoinCollected in TestsceneScript")
	$CoinCollectedSound.play()
