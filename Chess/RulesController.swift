//
//  RulesController.swift
//  Chess
//
//  Created by James Castrejon on 7/11/18.
//  Copyright © 2018 James Castrejon. All rights reserved.
//

import Foundation
import UIKit;

class RulesController: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if ((sender as? MainMenuController) != nil) {
            
        }
        
        let controller = segue.destination as! RuleController
        
        if segue.identifier == "PieceMovement" {
            controller.rTitle = "Piece Movement"
            controller.rDetails =
            """
            PAWN: Move forward 1 space or move forward 2 spaces if has not moved yet.  KNIGHT: Move 2 spaces away horizontally and 1 space away vertically. Move 2 spaces away vertically and 1 space away horizontally.  BISHOP: Can move in any amount in diagonal direction.  ROOK: Can move in any amount vertically and horizontally.  QUEEN: Can move in any amount in diagonal direction. Can move in any amount vertically and horizontally.  KING: Can move 1 space in diagonal direction. Can move 1 space vertically and horizontally.
            """
        }
        else if segue.identifier == "BasicRules" {
            controller.rTitle = "Basic Rules"
            controller.rDetails =
            """
            The objective of the game is to essentially TRAP the opposing KING in a position in which they cannot escape or be saved by other enemy pieces.  The player who controls the WHITE pieces goes first. Players take turns moving 1 piece at a time. A player has to move when it's their turn.  When moving any piece results in CHECK, the game ends in a STALEMATE. STALEMATE can occur if both player agree to a draw.  When an opposing piece can essentially capture the KING, then the KING is in CHECK. The player whos KING is in CHECK has to remove their KING from CHECK.  When the player whos KING is in CHECK cannot remove the threat of CHECK, then the game ends in CHECKMATE. This reults in the other player winning the game.
            """
        }
        else if segue.identifier == "SpecialConditions" {
            controller.rTitle = "Special Conditions"
            controller.rDetails =
            """
            EN PASSANT: When a PAWN moves 2 spaces forward and is horizontally next to an enemy PAWN, the enemy PAWN can capture the PAWN as if it was diagnolly in front of the enemy PAWN.  CASTLING: When a ROOK moves next to it's KING and the KING and ROOK have not yet moved, then the ROOK moves next to the KING and the KING can move onto the opposite side of the ROOK.  PAWN PROMOTION: When a PAWN reaches the enemies side of the board, the player decides if it promotes into a KNIGHT, BISHOP, ROOK, or QUEEN.
            """
        }
    }
    
    
}
