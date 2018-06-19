//
//  King.swift
//  Chess
//
//  Created by James Castrejon on 6/19/18.
//  Copyright © 2018 James Castrejon. All rights reserved.
//

import Foundation

class King: ChessPiece {
    var letter: Character
    var moveAmount: Int
    var type: Piece
    var paint: Color
    var hasMoved: Bool
    var inCheck: Bool
    
    init(_ paint: Color) {
        letter = "K"
        moveAmount = 1
        type = Piece.King
        self.paint = paint
        hasMoved = false
        inCheck = false
    }
}
