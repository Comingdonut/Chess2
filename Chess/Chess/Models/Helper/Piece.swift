//
//  Piece.swift
//  Chess
//
//  Created by James Castrejon on 6/19/18.
//  Copyright © 2018 James Castrejon. All rights reserved.
//

import Foundation

enum Piece: String {
    case None = ""
    case Pawn = "Pawn"
    case Knight = "Knight"
    case Bishop = "Bishop"
    case Rook = "Rook"
    case Queen = "Queen"
    case King = "King"
    
    func Name () -> String {
        return self.rawValue
    }
}
