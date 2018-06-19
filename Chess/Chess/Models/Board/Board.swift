//
//  Board.swift
//  Chess
//
//  Created by James Castrejon on 6/19/18.
//  Copyright © 2018 James Castrejon. All rights reserved.
//

import Foundation

class Board {
    
    var gameBoard: [[BoardSpace]]
    
    init() {
        gameBoard = Array(repeating: Array(repeating: BoardSpace(), count: 8), count: 8)
    }
    
    func resetBoard() {
        gameBoard = Array(repeating: Array(repeating: BoardSpace(), count: 8), count: 8)
    }
    
}
