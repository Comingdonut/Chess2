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
    
    var playerM = PlayerManager()
    var board = Board()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // TODO: Initialize board through a text file
        // TODO: (Optional) Save/Load game through text file
    }
    
    @IBAction func dismissToNames(_ sender: Any) {
        self.dismiss(animated: true)
    }
}
