#Instructions for Concept Level Design
Consider these conceptual. They are subject to change/alteration if necessary for increase in playability.
In the case of this document, "move" is equal to "teleport".
Prereqs: Must have GraphicsGale to view
How to Navigate:
	1. Each layer is a separate dimension. These layers can be turned visible/invisible for full/partial view in GraphicsGale.
	2. The layers rotate in the direction of RGB, or from the top layer to the bottom layer.
	3. Each pixel can be considered 1 4x4 square, or block.
Color Coding:
	1. Lighter Color - Puzzle blocks. These are the blocks necessary to move to solve the puzzle.
	2. Normal Color - Stationary (regular) blocks. These blocks are not necessary for solution but can be moved.
	3. Darker Color - Hazard blocks. These blocks present a hazard to the player and will prompt movement if touched. There are two types:
		A 1x1 hazard is considered a stationary (regular) hazard block. These remain in place and cannot be moved.
		A 4x4 hazard is considered an interactive hazard block (enemy). These will attack the player and can be moved.