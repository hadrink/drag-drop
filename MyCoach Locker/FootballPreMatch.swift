//
//  FootballPreMatch.swift
//  MyCoach Locker
//
//  Created by Rplay on 04/01/2017.
//  Copyright © 2017 rplay. All rights reserved.
//

import Foundation

protocol FootballPreMatchDelegate {
    func playersDidSwitch(player1DidSwitch player1: FootballPlayer, player2DidSwitch player2: FootballPlayer)
}

class FootballPreMatch: FootballTactical {
    
    init(tactical: Tactical) {
        super.init(team: tactical.team, composition: tactical.composition)
    }
    
    public func getTeam() -> FootballTeam {
        return self.team as! FootballTeam
    }
    
    public func getComposition() -> FootballComposition {
        return self.composition as! FootballComposition
    }
    
    public func getPlayersPerPositionsForTheMatch() -> Dictionary<String, Array<Player>>{
        return self.playersPositionForTheMatch!
    }
}
