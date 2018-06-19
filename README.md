# Chess-User-Interface
Solo Project (This was done for class, but after 2 years I restarted for fun.)

## Project Objective
The objective of this project is to translate the C# code in [Chess-Console](https://github.com/JamesCastrejon/Chess-Console) into a GUI.
More specifically, an iOS application that uses Swift as it's main language.

## History
The project was originally done about two years ago in C# WPF.

## Game Description:
A board game that requires two players to outwit each other through strategy. 
Typically, the game uses small objects to represent a real life battlefield.
The board being the field of combat and the pieces being soldiers.

## Game Objective
The objective of the game is not to "Kill" the opponents King but to essentially "Trap" them by
putting the enemy King in a position where they cannot escape or be saved by other opposing pieces.

Menu: [Insert image here when project is completed]

Board: [Insert image here when project is completed]

## Rules
#### Basic Conditions
1. The player who controls the white pieces moves first.
2. When one player is done with their turn, the next player goes next. This continues until the end of the game.
3. A player has to move when it is their turn.
4. A player can move only once a turn.
5. Pieces can only move by their respective movements.
6. Pieces may not move over opposing pieces with the exception of a Knight.

#### Win Conditions
1. If it is a player's turn and if moving any piece results in check, then the game ends in draw. This is called "Stalemate".
2. When the King is threaten with "Capture" but cannot escape or eliminate the piece that threatens it, then the King is in danger.
This is called "Check"
3. If the King is in "Check", then the player is required to removed the threat of capture and cannot end 
their turn until the threat is removed.
4. If the King is in "Check" and cannot remove "Check" in any legal way, then the player who's King is in "Check" loses.
This is "Checkmate". "Checkmate" causes the game to end.

#### Special Conditions
Specific pieces can move in special ways under the right circumstance. These special movements are called "Castling" and "En Passant".
"Pawn Promotion" is a special conditional in which a player's Pawn reaches the opponent's 
side of the board and has an opportunity to promote to a stronger piece.
