//
//  PlayerNameController.swift
//  Chess
//
//  Created by James Castrejon on 7/12/18.
//  Copyright © 2018 James Castrejon. All rights reserved.
//

import Foundation
import UIKit

class PlayerNameController: UIViewController {
    
    @IBOutlet var name1: UITextField!
    @IBOutlet var name2: UITextField!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as! GameController;
        
        if name1.text != "" {
            controller.playerM.player1.name = name1.text!
        }
        if name2.text != "" {
            controller.playerM.player2.name = name2.text!
        }
    }
    
    @IBAction func dismissToMainMenu(_ sender: Any) {
        self.dismiss(animated: true)
    }
}
