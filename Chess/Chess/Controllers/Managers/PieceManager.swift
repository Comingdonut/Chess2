//
//  PieceManager.swift
//  Chess
//
//  Created by James Castrejon on 6/19/18.
//  Copyright © 2018 James Castrejon. All rights reserved.
//

import Foundation

class PieceManager {
    var currentKing: [Int: Int]
    
    init() {
        currentKing = [-1: -1]
    }
    
    func HandlePiece(_ piece: inout ChessPiece, _ x: Int, _ new_x: Int, _ new_y: Int) {
        switch piece.type {
        case Piece.Pawn:
            if !(piece as! Pawn).hasMoved {
                (piece as! Pawn).moveAmount = 1
                (piece as! Pawn).hasMoved = true
            }
            if PawnPromotion(piece.paint, new_x) {
                (piece as! Pawn).promote = true
            }
            if PawnMovedTwice(x, new_x) {
                (piece as! Pawn).movedTwice = true
            }
            break
        case Piece.Rook:
            (piece as! Rook).hasMoved = true
            if IsCastling(new_x, new_y) {
                (piece as! Rook).canCastle = true
            }
            break
        case Piece.King:
            (piece as! King).hasMoved = true
            break
        default:
            break
        }
    }
    
    func PawnMovedTwice(_ x: Int, _ new_x: Int) -> Bool {
        return abs(new_x - x) == 2
    }
    
    func PawnPromotion(_ paint: Color, _ new_x: Int) -> Bool {
        return (paint == Color.Black && new_x == 7) || (paint == Color.White && new_x == 0)
    }
    
    func IsCastling(_ new_x: Int, _ new_y: Int) -> Bool {
        return new_x == currentKing.keys.first! && new_y == currentKing.values.first!
    }
    
    func FindKing(_ board: [[BoardSpace]], _ paint: Color) {
        for x in 0...board.count - 1 {
            for y in 0...board[x].count - 1 {
                if board[x][y].piece != nil {
                    if board[x][y].piece?.paint == paint && board[x][y].piece?.type == Piece.King {
                        currentKing = [x: y]
                        return
                    }
                }
            }
        }
    }
    
    func ResetMovedTwice(_ board: [[BoardSpace]],_ paint: Color) {
        for section in board {
            for space in section {
                if !space.isEmpty && space.piece?.paint == nil {
                    if space.piece?.type == Piece.Pawn && (space.piece as! Pawn).hasMoved {
                        (space.piece as! Pawn).movedTwice = false
                    }
                }
            }
        }
    }
    
    func PromotePawn(_ option: Int, _ paint: Color) -> ChessPiece {
        var piece: ChessPiece? = nil;
        switch option {
        case 1:
            piece = Knight(paint)
            break
        case 2:
            piece = Bishop(paint)
            break
        case 3:
            piece = Rook(paint)
            break
        case 4:
            piece = Queen(paint)
            break;
        default:
            break
        }
        return piece!
    }
}
