extends Control

func _process(delta):
	$CoinLabel.text = str(GlobalPlayer.coin)
	$HPLabel.text = str(GlobalPlayer.hp)
