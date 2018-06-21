//
//  Pawn.swift
//  Chess
//
//  Created by James Castrejon on 6/19/18.
//  Copyright © 2018 James Castrejon. All rights reserved.
//

import Foundation

class Pawn: ChessPiece {
    var letter: Character
    var moveAmount: Int
    var type: Piece
    var paint: Color
    var hasMoved: Bool
    var movedTwice: Bool
    var canEnPassant: Bool
    var promote: Bool
    
    init(_ paint: Color) {
        letter = "P"
        moveAmount = 2
        type = Piece.Pawn
        self.paint = paint
        hasMoved = false
        movedTwice = false
        canEnPassant = false
        promote = false
    }
}
