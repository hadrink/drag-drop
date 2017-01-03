//
//  Player.swift
//  MyCoach Locker
//
//  Created by Rplay on 03/01/2017.
//  Copyright © 2017 rplay. All rights reserved.
//

import Foundation

protocol Player {
    var name: String {get set}
    var age: Int {get set}
    var positions: Array<Position> {get set}
    var team: Team? {get set}
    
    func updatePositions(positions: Array<Position>)
}
