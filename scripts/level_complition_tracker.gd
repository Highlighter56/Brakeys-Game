extends Node2D

var completedLevelOne = false
var completedLevelTwo = false
var completedLevelThree = false

var gameStarted:bool = false

func _ready():
	pass

func _process(delta):
	pass

func getCompletedLevelOne() -> bool:
	return completedLevelOne
func getCompletedLevelTwo() -> bool:
	return completedLevelTwo
func getCompletedLevelThree() -> bool:
	return completedLevelThree

func hasCompletedAllLevels() -> bool:
	return completedLevelOne and completedLevelTwo and completedLevelThree
