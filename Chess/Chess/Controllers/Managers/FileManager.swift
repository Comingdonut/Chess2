//
//  FileManager.swift
//  Chess
//
//  Created by James Castrejon on 7/21/18.
//  Copyright © 2018 James Castrejon. All rights reserved.
//

import Foundation

class FileManager {
    
    func loadFile(file path: String) -> [String] {
        var myStrings: [String] = []
        if let path = Bundle.main.path(forResource: path, ofType: "txt") {
            do {
                let data = try String(contentsOfFile: path, encoding: .utf8)
                myStrings = data.components(separatedBy: .newlines)
            } catch {
                print(error)
            }
        }
        return myStrings;
    }
    
    func set(color: String) -> Color {
        var paint: Color;
        switch color {
        case "w":
            paint = Color.White
            break
        case "b":
            paint = Color.Black
            break
        default:
            paint = Color.White
            break
        }
        return paint
    }
    
    func set(piece: String, colored paint: Color) -> ChessPiece {
        var p: ChessPiece = Pawn(paint);
        switch piece {
        case "p":
            p = Pawn(paint)
            break
        case "n":
            p = Knight(paint)
            break
        case "b":
            p = Bishop(paint)
            break
        case "r":
            p = Rook(paint)
            break
        case "q":
            p = Queen(paint)
            break
        case "k":
            p = King(paint)
            break
        default:
            break
        }
        return p
    }
}
