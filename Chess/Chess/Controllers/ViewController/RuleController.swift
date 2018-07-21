//
//  RuleController.swift
//  Chess
//
//  Created by James Castrejon on 7/11/18.
//  Copyright © 2018 James Castrejon. All rights reserved.
//

import Foundation
import UIKit

class RuleController: UIViewController {
    
    @IBOutlet weak var ruleTitle: UILabel!
    @IBOutlet weak var ruleDetails: UITextView!
    
    var rTitle: String = "";
    var rDetails: String = "";
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ruleTitle.text = rTitle;
        ruleDetails.text = rDetails;
    }
    
    @IBAction func dismissToRules(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
}
