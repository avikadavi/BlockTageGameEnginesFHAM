extends Node3D


@export var Coins: Array
var coinsCount := 0
var timeinScene := 0.0

var maxcoinsRatio
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Coins = get_tree().get_nodes_in_group("Coin")
	$Timer.start()
	$UserInterfaceJumpRun/Button.button_down.connect(RestartGame)

	for coin in Coins:
		print(coin)
		coin.CoinCollectedSignal.connect(onCoinCollected)
		
	maxcoinsRatio = 100.0 / Coins.size()
	$UserInterfaceJumpRun/ProgressBar.value = 0


func onCoinCollected(coinThatEmits) -> void:
	print("CoinCollected in TestsceneScript")
	$CoinCollectedSound.position = coinThatEmits.position
	$CoinCollectedSound.play()
	Coins.erase(coinThatEmits)
	print(Coins.size())
	for coin in Coins:
		print(coin.name)
	print("-----------")
	coinsCount += 1
	$UserInterfaceJumpRun.SetText(str(coinsCount))
	$UserInterfaceJumpRun/ProgressBar.value += maxcoinsRatio

func RestartGame():
	get_tree().reload_current_scene()

func _on_timer_timeout() -> void:
	timeinScene += $Timer.wait_time
	$UserInterfaceJumpRun/LabelTimer.text = "%.2f" % timeinScene
