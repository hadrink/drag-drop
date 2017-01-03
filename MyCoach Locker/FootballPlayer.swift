//
//  FootballPlayers.swift
//  MyCoach Locker
//
//  Created by Rplay on 03/01/2017.
//  Copyright © 2017 rplay. All rights reserved.
//

import Foundation

class FootballPlayer: Player {
    var name: String
    var age: Int
    var positions: Array<Position>
    var team: Team?
    
    init(name: String, age: Int, positions: Array<Position>) {
        self.name = name
        self.age = age
        self.positions = positions
    }
    
    /**
     Update positions of a football player
     
     - Parameter:
        - positions: New positions for a player
    */
    
    func updatePositions(positions: Array<Position>) {
        self.positions = positions
    }
}
