//
//  GameController.swift
//  Chess
//
//  Created by James Castrejon on 7/12/18.
//  Copyright © 2018 James Castrejon. All rights reserved.
//

import Foundation
import UIKit

class GameController: UIViewController {
    
    @IBOutlet weak var playerLabel: UILabel!
    @IBOutlet weak var boardView: UIStackView!
    
    var fileM = FileManager()
    var playerM = PlayerManager()
    var b = Board()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBoardFromTextFile()
        setupBoardView()
        // TODO: (Optional) Save/Load game through text file
    }
    
    func setupBoardFromTextFile() {
        let setup = fileM.loadFile(file: "board")
        var row: [BoardSpace] = []
        var columnInRowCount = 0;
        for chessPiece in setup {
            if !chessPiece.isEmpty {
                let details = chessPiece.components(separatedBy: "|")
                if details.count > 1 {
                    let paint = fileM.set(color: details[1])
                    row.append(BoardSpace(fileM.set(piece: details[2], colored: paint)))
                    columnInRowCount += 1
                }
                else {
                    row.append(BoardSpace())
                    columnInRowCount += 1
                }
            }
            if columnInRowCount == 8 {
                b.board.append(row)
                row = []
                columnInRowCount = 0
            }
        }
    }
    
    func setupBoardView() {
        for x in stride(from: 1, to: boardView.subviews.count, by: 1) {
            let rowView = (boardView.subviews[x] as! UIStackView)
            for y in stride(from: 1, to: rowView.subviews.count, by: 1) {
                let button = rowView.subviews[y] as! UIButton;
                button.setTitle(b.board[x-1][y-1].description, for: .normal)
            }
        }
    }
    
    @IBAction func dismissToNames(_ sender: Any) {
        self.dismiss(animated: true)
    }
}
