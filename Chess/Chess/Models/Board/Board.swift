//
//  Board.swift
//  Chess
//
//  Created by James Castrejon on 6/19/18.
//  Copyright © 2018 James Castrejon. All rights reserved.
//

import Foundation

class Board {
    
    var board: [[BoardSpace]]
    
    init() {
        board = Array(repeating: Array(repeating: BoardSpace(), count: 8), count: 8)
    }
    
    func resetBoard() {
        board = Array(repeating: Array(repeating: BoardSpace(), count: 8), count: 8)
    }
    
}
