//
//  ChessPiece.swift
//  Chess
//
//  Created by James Castrejon on 6/19/18.
//  Copyright © 2018 James Castrejon. All rights reserved.
//

import Foundation

protocol ChessPiece {
    var letter: Character { get set }
    var moveAmount: Int { get set }
    var type: Piece { get set }
    var paint: Color { get set }
}
