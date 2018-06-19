//
//  Queen.swift
//  Chess
//
//  Created by James Castrejon on 6/19/18.
//  Copyright © 2018 James Castrejon. All rights reserved.
//

import Foundation

class Queen: ChessPiece {
    var letter: Character
    var moveAmount: Int
    var type: Piece
    var paint: Color
    
    init(paint: Color) {
        letter = "Q"
        moveAmount = 7
        type = Piece.Queen
        self.paint = paint
    }
    
}
