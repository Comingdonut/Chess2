//
//  BoardSpace.swift
//  Chess
//
//  Created by James Castrejon on 6/19/18.
//  Copyright © 2018 James Castrejon. All rights reserved.
//

import Foundation

class BoardSpace: CustomStringConvertible {
    
    var isEmpty: Bool
    var piece: ChessPiece?
    
    init() {
        self.isEmpty = true
        piece = nil
    }
    
    init(piece: ChessPiece) {
        isEmpty = false
        self.piece = piece
    }
    
    var description: String
    {
        if piece == nil {
            return ""
        }
        return piece!.type.Name()
    }
}
