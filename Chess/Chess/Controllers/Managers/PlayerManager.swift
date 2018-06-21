//
//  PlayerManager.swift
//  Chess
//
//  Created by James Castrejon on 6/19/18.
//  Copyright © 2018 James Castrejon. All rights reserved.
//

import Foundation

class PlayerManager {
    var player1: Player
    var player2: Player
    var currentP: Player
    
    init() {
        player1 = Player("Player 1", Color.White)
        player2 = Player("Player 2", Color.Black)
        currentP = player1
    }
    
    func SwitchPlayer() {
        if currentP.name == player1.name {
            currentP = player2
        }
        else {
            currentP = player1
        }
    }
}
