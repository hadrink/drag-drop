//
//  Team.swift
//  MyCoach Locker
//
//  Created by Rplay on 03/01/2017.
//  Copyright © 2017 rplay. All rights reserved.
//

import Foundation

protocol Team {
    var name: String {get set}
    var players: Array<Player>? {get set}
    
    func addPlayer(player: Player)
    func removePlayer(player: Player)
}
