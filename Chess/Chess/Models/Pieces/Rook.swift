//
//  Rook.swift
//  Chess
//
//  Created by James Castrejon on 6/19/18.
//  Copyright © 2018 James Castrejon. All rights reserved.
//

import Foundation

class Rook: ChessPiece {
    var letter: Character
    var moveAmount: Int
    var type: Piece
    var paint: Color
    var hasMoved: Bool
    var canCastle: Bool
    
    init(_ paint: Color) {
        letter = "R"
        moveAmount = 7
        type = Piece.Rook
        self.paint = paint
        hasMoved = false
        canCastle = false
    }
}
