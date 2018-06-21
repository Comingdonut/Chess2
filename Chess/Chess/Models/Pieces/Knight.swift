//
//  Knight.swift
//  Chess
//
//  Created by James Castrejon on 6/19/18.
//  Copyright © 2018 James Castrejon. All rights reserved.
//

import Foundation

class Knight: ChessPiece {
    var letter: Character
    var moveAmount: Int
    var type: Piece
    var paint: Color
    
    init(_ paint: Color) {
        letter = "N"
        moveAmount = 7
        type = Piece.Knight
        self.paint = paint
    }
}
