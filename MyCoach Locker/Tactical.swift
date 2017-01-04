//
//  Tactical.swift
//  MyCoach Locker
//
//  Created by Rplay on 03/01/2017.
//  Copyright © 2017 rplay. All rights reserved.
//

import Foundation

protocol Tactical {
    var team: Team {get set}
    var composition: Composition {get set}
    
    func switchComposition(composition: Composition)
    //func switchPlayer(player1: Player?, player2: Player?)
}
