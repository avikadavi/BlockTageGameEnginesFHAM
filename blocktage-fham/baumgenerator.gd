extends Node3D

var treeTemplate = preload("res://baum.tscn")
@export var countTrees = 1000

func _ready() -> void:
	var sizeGround = $"../Boden".size
	var offSet = Vector3(-sizeGround.x /2, 0, -sizeGround.z /2 )
	var startX = offSet.x
	print(offSet)
	print("--------------")
	for i in range(sizeGround.x / 10):
		for j in range(sizeGround.z /10 ):
			var newTree = treeTemplate.instantiate()
			var Randompos = Vector3(randi_range(2,8), 0, randi_range(2,8)) + offSet
			newTree.position = Randompos
			offSet.x += 10
			print(offSet)
			add_child(newTree)
		
		offSet.x = startX
		offSet.z += 10
	
func _process(delta: float) -> void:
	pass
