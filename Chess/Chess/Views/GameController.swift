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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func dismissToNames(_ sender: Any) {
        self.dismiss(animated: true)
    }
}
