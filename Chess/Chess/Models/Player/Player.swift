//
//  Player.swift
//  Chess
//
//  Created by James Castrejon on 6/19/18.
//  Copyright © 2018 James Castrejon. All rights reserved.
//

import Foundation

class Player {
    var name: String;
    var color: Color;
    // TODO: Add Time History
    // TODO: Add Move History
    init(_ name: String, _ color: Color) {
        self.name = name;
        self.color = color;
    }
}
