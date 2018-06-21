//
//  MovementManager.swift
//  Chess
//
//  Created by James Castrejon on 6/20/18.
//  Copyright © 2018 James Castrejon. All rights reserved.
//

import Foundation

class MovementManager {
    let ZERO: Int = 0
    let EIGHT: Int = 8
    let SWITCH_DIR: Int = -1
    
    var dir: Int
    var piece_x: Int
    var piece_y: Int
    var pieceM: PieceManager
    
    init() {
        dir = 0
        piece_x = -1
        piece_y = -1
        pieceM = PieceManager()
    }
    
    func SetCoordinates(x piece_x: Int, y piece_y: Int) {
        self.piece_x = piece_x
        self.piece_y = piece_y
    }
    
    // MARK: - Determine Normal Movement
    
    func DeterminePieceMovement(_ piece: ChessPiece) -> [[Int: Int]] {
        var movement = [[Int: Int]]()
        SetDirection(piece.paint)
        switch piece.type {
        case Piece.Pawn:
            for tRight in HorizontalLeft(piece.moveAmount) {
                movement.append([Array(tRight)[0].key: Array(tRight)[0].value])
            }
            break
        case Piece.Knight:
            for knight in KnightMovement() {
                movement.append([Array(knight)[0].key: Array(knight)[0].value])
            }
            break
        case Piece.Bishop:
            for tLeft in DiagonalTopLeft(piece.moveAmount) {
                movement.append([Array(tLeft)[0].key: Array(tLeft)[0].value])
            }
            for tRight in DiagonalTopRight(piece.moveAmount) {
                movement.append([Array(tRight)[0].key: Array(tRight)[0].value])
            }
            for bLeft in DiagonalBottomLeft(piece.moveAmount) {
                movement.append([Array(bLeft)[0].key: Array(bLeft)[0].value])
            }
            for bRight in DiagonalBottomRight(piece.moveAmount) {
                movement.append([Array(bRight)[0].key: Array(bRight)[0].value])
            }
            break
        case Piece.Rook:
            for forward in VerticalForward(piece.moveAmount) {
                movement.append([Array(forward)[0].key: Array(forward)[0].value])
            }
            for backward in VerticalBackward(piece.moveAmount) {
                movement.append([Array(backward)[0].key: Array(backward)[0].value])
            }
            for left in HorizontalLeft(piece.moveAmount) {
                movement.append([Array(left)[0].key: Array(left)[0].value])
            }
            for right in HorizontalRight(piece.moveAmount) {
                movement.append([Array(right)[0].key: Array(right)[0].value])
            }
            break
        case Piece.Queen:
            for forward in VerticalForward(piece.moveAmount) {
                movement.append([Array(forward)[0].key: Array(forward)[0].value])
            }
            for backward in VerticalBackward(piece.moveAmount) {
                movement.append([Array(backward)[0].key: Array(backward)[0].value])
            }
            for left in HorizontalLeft(piece.moveAmount) {
                movement.append([Array(left)[0].key: Array(left)[0].value])
            }
            for right in HorizontalRight(piece.moveAmount) {
                movement.append([Array(right)[0].key: Array(right)[0].value])
            }
            for tLeft in DiagonalTopLeft(piece.moveAmount) {
                movement.append([Array(tLeft)[0].key: Array(tLeft)[0].value])
            }
            for tRight in DiagonalTopRight(piece.moveAmount) {
                movement.append([Array(tRight)[0].key: Array(tRight)[0].value])
            }
            for bLeft in DiagonalBottomLeft(piece.moveAmount) {
                movement.append([Array(bLeft)[0].key: Array(bLeft)[0].value])
            }
            for bRight in DiagonalBottomRight(piece.moveAmount) {
                movement.append([Array(bRight)[0].key: Array(bRight)[0].value])
            }
            break
        case Piece.King:
            for forward in VerticalForward(piece.moveAmount) {
                movement.append([Array(forward)[0].key: Array(forward)[0].value])
            }
            for backward in VerticalBackward(piece.moveAmount) {
                movement.append([Array(backward)[0].key: Array(backward)[0].value])
            }
            for left in HorizontalLeft(piece.moveAmount) {
                movement.append([Array(left)[0].key: Array(left)[0].value])
            }
            for right in HorizontalRight(piece.moveAmount) {
                movement.append([Array(right)[0].key: Array(right)[0].value])
            }
            for tLeft in DiagonalTopLeft(piece.moveAmount) {
                movement.append([Array(tLeft)[0].key: Array(tLeft)[0].value])
            }
            for tRight in DiagonalTopRight(piece.moveAmount) {
                movement.append([Array(tRight)[0].key: Array(tRight)[0].value])
            }
            for bLeft in DiagonalBottomLeft(piece.moveAmount) {
                movement.append([Array(bLeft)[0].key: Array(bLeft)[0].value])
            }
            for bRight in DiagonalBottomRight(piece.moveAmount) {
                movement.append([Array(bRight)[0].key: Array(bRight)[0].value])
            }
            break
        }
        return movement
    }
    
    func SetDirection(_ paint: Color) {
        dir = 1
        if paint == Color.White {
            dir = -1
        }
    }
    
    func CheckBoundary(_ row_column: Int) -> Bool {
        var isValid = false
        if row_column >= ZERO && row_column < EIGHT {
            isValid = true
        }
        return isValid
    }
    
    // MARK: - Normal Movement Availability Checks
    
    func VerticalForward(_ amount: Int) -> [[Int: Int]] {
        var movement = [[Int: Int]]()
        var moveCount = amount
        var x = piece_x
        repeat {
            x += dir
            movement.append([x: piece_y])
            moveCount-=1;
        } while moveCount != 0
        return movement
    }
    
    func VerticalBackward(_ amount: Int) -> [[Int: Int]] {
        var movement = [[Int: Int]]()
        var moveCount = amount
        var x = piece_x
        repeat {
            x += dir * SWITCH_DIR
            movement.append([x: piece_y])
            moveCount-=1;
        } while moveCount != 0
        return movement
    }
    
    func HorizontalLeft(_ amount: Int) -> [[Int: Int]] {
        var movement = [[Int: Int]]()
        var moveCount = amount
        var y = piece_y
        repeat {
            y += dir
            movement.append([piece_x: y])
            moveCount-=1;
        } while moveCount != 0
        return movement
    }
    
    func HorizontalRight(_ amount: Int) -> [[Int: Int]] {
        var movement = [[Int: Int]]()
        var moveCount = amount
        var y = piece_y
        repeat {
            y += dir * SWITCH_DIR
            movement.append([piece_x: y])
            moveCount-=1;
        } while moveCount != 0
        return movement
    }
    
    func DiagonalTopLeft(_ amount: Int) -> [[Int: Int]] {
        var movement = [[Int: Int]]()
        var moveCount = amount
        var x = piece_x
        var y = piece_y
        repeat {
            x += dir
            y += dir
            movement.append([x: y])
            moveCount-=1;
        } while moveCount != 0
        return movement
    }
    
    func DiagonalBottomRight(_ amount: Int) -> [[Int: Int]] {
        var movement = [[Int: Int]]()
        var moveCount = amount
        var x = piece_x * SWITCH_DIR
        var y = piece_y * SWITCH_DIR
        repeat {
            x += dir
            y += dir
            movement.append([x: y])
            moveCount-=1;
        } while moveCount != 0
        return movement
    }
    
    func DiagonalTopRight(_ amount: Int) -> [[Int: Int]] {
        var movement = [[Int: Int]]()
        var moveCount = amount
        var x = piece_x
        var y = piece_y
        repeat {
            x += dir
            y += dir * SWITCH_DIR
            movement.append([x: y])
            moveCount-=1;
        } while moveCount != 0
        return movement
    }
    
    func DiagonalBottomLeft(_ amount: Int) -> [[Int: Int]] {
        var movement = [[Int: Int]]()
        var moveCount = amount
        var x = piece_x
        var y = piece_y
        repeat {
            x += dir * SWITCH_DIR
            y += dir
            movement.append([x: y])
            moveCount-=1;
        } while moveCount != 0
        return movement
    }
    
    func KnightMovement() -> [[Int: Int]] {
        var movement = [[Int: Int]]()
        let x = piece_x
        let y = piece_y
        movement.append([x - 1: y - 2])
        movement.append([x - 2: y - 1])
        movement.append([x - 2: y + 1])
        movement.append([x - 1: y + 2])
        movement.append([x + 1: y + 2])
        movement.append([x + 2: y + 1])
        movement.append([x + 2: y - 1])
        movement.append([x + 1: y - 2])
        return movement
    }
    
    // MARK: - Removing Invalid Movement
    
    func RemoveInvalidMovement(_ board: [[BoardSpace]], _ movement: inout [[Int: Int]], _ piece: ChessPiece) {
        var currMovement = -1
        var currPair = -1
        var knightRestrictions = [[Int: Int]]()
        for m in 0...movement.count - 1 {
            if movement[0].count != 0 {
                for p in 0...movement[m].count - 1 {
                    let x: Int = Array(movement[m])[p].key
                    let y: Int = Array(movement[m])[p].value
                    if piece.type == Piece.Knight {
                        if !CheckBoundary(x) || !CheckBoundary(y) || (!board[x][y].isEmpty && board[x][y].piece?.paint == piece.paint) {
                            knightRestrictions.append([x: y])
                        }
                    }
                    else if !CheckBoundary(x) || !CheckBoundary(y) {
                        currMovement = m
                        currPair = p
                        break
                    }
                    else if (!board[x][y].isEmpty && board[x][y].piece?.paint == piece.paint) ||
                        (!board[x][y].isEmpty && board[x][y].piece?.paint == piece.paint && piece.type == Piece.Pawn) {
                        currMovement = m
                        currPair = p
                        break
                    }
                    else if !board[x][y].isEmpty && board[x][y].piece?.paint != piece.paint {
                        currMovement = m
                        currPair = p + 1
                    }
                }
            }
            if currPair != -1 {
                let count = movement[currMovement].count
                for _ in currPair...count - 1 {
                    movement[currMovement].remove(at: movement[0].index(forKey: currPair)!)
                }
                currMovement = -1
                currPair = -1
            }
            if knightRestrictions.count != 0 {
                var index = 0
                for move in movement {
                    for rest in knightRestrictions {
                        if Array(rest)[0].key == Array(movement[index])[0].key && Array(rest)[0].value == Array(movement[index])[0].value {
                            movement[index].removeValue(forKey: Array(move)[0].key)
                            break
                        }
                    }
                    index+=1
                }
            }
        }
    }
    
    // MARK: - Determine Special Available Movement
    
    func DetermineSpecialMovement(_ board: [[BoardSpace]], _ piece: ChessPiece) -> [[Int: Int]]{
        var movement = [[Int: Int]]()
        SetDirection(piece.paint)
        if piece.type == Piece.Rook && !(piece as! Rook).hasMoved {
            for castle in Castling(board, piece.paint) {
                movement.append([Array(castle)[0].key: Array(castle)[0].value])
            }
        }
        else if piece.type == Piece.Pawn {
            for pawn in PawnCapture(board, piece.paint) {
                movement.append([Array(pawn)[0].key: Array(pawn)[0].value])
            }
            for pawn in EnPassant(board, piece.paint) {
                movement.append([Array(pawn)[0].key: Array(pawn)[0].value])
            }
        }
        return movement
    }
    
    // MARK: - Special Movement Availability Checks
    
    func Castling(_ board: [[BoardSpace]], _ paint: Color) -> [[Int: Int]] {
        var movement = [[Int: Int]]()
        var move = [[Int: Int]]()
        for left in HorizontalLeft(7) {
            movement.append([Array(left)[0].key: Array(left)[0].value])
        }
        for right in HorizontalRight(7) {
            movement.append([Array(right)[0].key: Array(right)[0].value])
        }
        for m in 0...movement.count - 1 {
            if movement[0].count != 0 {
                for p in 0...movement[m].count - 1 {
                    let x: Int = Array(movement[m])[p].key
                    let y: Int = Array(movement[m])[p].value
                    if !CheckBoundary(x) || !CheckBoundary(y) {
                        break;
                    }
                    else if !board[x][y].isEmpty && board[x][y].piece?.paint == paint {
                        if board[x][y].piece?.type == Piece.King && !(board[x][y].piece as! King).hasMoved  {
                            move.append([x: y])
                        }
                        break
                    }
                }
            }
        }
        return move
    }
    
    func PawnCapture(_ board: [[BoardSpace]], _ paint: Color) -> [[Int: Int]] {
        var movement = [[Int: Int]]()
        var move = [[Int: Int]]()
        for tLeft in DiagonalTopLeft(1) {
            movement.append([Array(tLeft)[0].key: Array(tLeft)[0].value])
        }
        for tRight in DiagonalTopRight(1) {
            movement.append([Array(tRight)[0].key: Array(tRight)[0].value])
        }
        for m in 0...movement.count - 1 {
            if movement[0].count != 0 {
                for p in 0...movement[m].count - 1 {
                    let x: Int = Array(movement[m])[p].key
                    let y: Int = Array(movement[m])[p].value
                    if !CheckBoundary(x) || !CheckBoundary(y) {
                        break;
                    }
                    else if !board[x][y].isEmpty && board[x][y].piece?.paint == paint {
                        move.append([x: y])
                    }
                }
            }
        }
        return move
    }
    
    func EnPassant(_ board: [[BoardSpace]], _ paint: Color) -> [[Int: Int]] {
        var movement = [[Int: Int]]()
        var move = [[Int: Int]]()
        for left in HorizontalLeft(1) {
            movement.append([Array(left)[0].key: Array(left)[0].value])
        }
        for right in HorizontalRight(1) {
            movement.append([Array(right)[0].key: Array(right)[0].value])
        }
        for m in 0...movement.count - 1 {
            if movement[0].count != 0 {
                for p in 0...movement[m].count - 1 {
                    let x: Int = Array(movement[m])[p].key
                    let y: Int = Array(movement[m])[p].value
                    if !CheckBoundary(x) || !CheckBoundary(y) {
                        break;
                    }
                    else if !board[x][y].isEmpty && board[x][y].piece?.paint != paint {
                        if board[x][y].piece?.type == Piece.Pawn && (board[x][y].piece as! Pawn).movedTwice {
                            move.append([x: y])
                            (board[piece_x][piece_y].piece as! Pawn).canEnPassant = true
                        }
                    }
                }
            }
        }
        return move
    }
    
    // MARK: - Check and Checkmate
    
    func Check(_ board: [[BoardSpace]], _ paint: Color) -> Bool {
        pieceM.FindKing(board, paint)
        if Array(pieceM.currentKing)[0].key != -1 {
            var movement = [[Int: Int]]()
            var enemyChecks = [[Int: Int]]()
            let kingX = Array(pieceM.currentKing)[0].key
            let kingY = Array(pieceM.currentKing)[0].value
            let kingPiece = board[kingX][kingY].piece
            
            SetCoordinates(x: kingX, y: kingY)
            SetDirection(paint)
            for forward in VerticalForward(7) {
                movement.append([Array(forward)[0].key: Array(forward)[0].value])
            }
            for backward in VerticalBackward(7) {
                movement.append([Array(backward)[0].key: Array(backward)[0].value])
            }
            for left in HorizontalLeft(7) {
                movement.append([Array(left)[0].key: Array(left)[0].value])
            }
            for right in HorizontalRight(7) {
                movement.append([Array(right)[0].key: Array(right)[0].value])
            }
            for tLeft in DiagonalTopLeft(7) {
                movement.append([Array(tLeft)[0].key: Array(tLeft)[0].value])
            }
            for tRight in DiagonalTopRight(7) {
                movement.append([Array(tRight)[0].key: Array(tRight)[0].value])
            }
            for bLeft in DiagonalBottomLeft(7) {
                movement.append([Array(bLeft)[0].key: Array(bLeft)[0].value])
            }
            for bRight in DiagonalBottomRight(7) {
                movement.append([Array(bRight)[0].key: Array(bRight)[0].value])
            }
            for knight in KnightMovement() {
                movement.append([Array(knight)[0].key: Array(knight)[0].value])
            } // TODO: - Knight Movement might be Removed prematurly
            RemoveInvalidMovement(board, &movement, kingPiece!)
            
            for group in movement {
                for move in group {
                    let enemyX = move.key
                    let enemyY = move.value
                    var enemyPiece = board[enemyX][enemyY].piece
                    if !board[enemyX][enemyY].isEmpty && enemyPiece?.paint != kingPiece?.paint {
                        SetCoordinates(x: enemyX, y: enemyY)
                        var eMovement = DeterminePieceMovement(enemyPiece!)
                        for pawn in PawnCapture(board, (enemyPiece?.paint)!) {
                            eMovement.append([Array(pawn)[0].key: Array(pawn)[0].value])
                        }
                        RemoveInvalidMovement(board, &eMovement, enemyPiece!)
                        for eGroup in eMovement {
                            for eMove in eGroup {
                                if eMove.key == kingX && eMove.value == kingY {
                                    enemyChecks.append([enemyX: enemyY])
                                    (kingPiece as! King).inCheck = true
                                    return true
                                }
                            }
                        }
                    }
                }
            }
        }
        return false
    }
    
    func Check(_ board: inout[[BoardSpace]], paint: Color, x: Int, y: Int, new_x: Int, new_y: Int) -> Bool {
        let piece = board[x][y].piece
        var newPiece: ChessPiece? = nil
        if !board[new_x][new_y].isEmpty {
            newPiece = board[new_x][new_y].piece
        }
        board[x][y] = BoardSpace()
        board[new_x][new_y] = BoardSpace(piece!)
        
        let inCheck = Check(board, paint)
        
        board[x][y] = BoardSpace(piece!)
        if newPiece != nil {
            board[new_x][new_y] = BoardSpace(newPiece!)
        }
        else {
            board[new_x][new_y] = BoardSpace()
        }
        
        pieceM.FindKing(board, paint)
        
        return inCheck
    }
    
    func Checkmate(_ board: inout [[BoardSpace]], _ playerPaint: Color) -> Bool {
        var checkmate = true
        var movement = [[Int: Int]]()
        var xIndex = 0
        var yIndex = 0
        for section in board {
            for move in section {
                var piece = move.piece
                if piece != nil && piece?.paint == playerPaint {
                    SetCoordinates(x: xIndex, y: yIndex)
                    movement = DeterminePieceMovement(piece!)
                    RemoveInvalidMovement(board, &movement, piece!)
                    for special in DetermineSpecialMovement(board, piece!) {
                        movement.append([Array(special)[0].key: Array(special)[0].value])
                    }
                    for m in 0...movement.count {
                        if movement[m].count > 0 && !Check(&board, paint: (piece?.paint)!, x: xIndex, y: yIndex, new_x: Array(movement[m])[0].key, new_y: Array(movement[m])[0].value) {
                            checkmate = false
                            return checkmate
                        }
                    }
                }
                yIndex += 1
            }
            xIndex += 1
        }
        return checkmate
    }
    
    // MARK: - Checking Movement Validity and Moving Pieces
    
    func CheckAvailability(movement: [[Int: Int]], x: Int, y: Int) -> Bool {
        var available = false
        for move in movement {
            if move.count != 0 {
                for m in move {
                    if m.key == x && m.value == y {
                        available = true
                        return available
                    }
                }
            }
        }
        return available
    }
    
    func MovePiece(board: inout [[BoardSpace]], x: Int, y: Int, new_x: Int, new_y: inout Int) {
        var piece = board[x][y].piece
        pieceM.ResetMovedTwice(board, (piece?.paint)!)
        pieceM.HandlePiece(&piece!, x, new_x, new_y)
        if piece?.type == Piece.Rook && (piece as! Rook).canCastle {
            let king = board[new_x][new_y].piece
            board[new_x][new_y] = BoardSpace()
            if y == 0 {
                board[new_x][new_y - 2] = BoardSpace(king!)
                new_y-=1
            }
            else if y == 7 {
                board[new_x][new_y + 2] = BoardSpace(king!)
                new_y+=1
            }
            (piece as! Rook).canCastle = false
        }
        else if piece?.type == Piece.Pawn {
            if (piece as! Pawn).canEnPassant {
                board[new_x - dir][new_y] = BoardSpace()
                (piece as! Pawn).canEnPassant = false
            }
            else if (piece as! Pawn).promote {
                // Pop to select a piece here
                let REPLACEME = 0
                piece = pieceM.PromotePawn(REPLACEME, (piece?.paint)!)
            }
        }
        board[x][y] = BoardSpace()
        board[new_x][new_y] = BoardSpace(piece!)
    }
}
