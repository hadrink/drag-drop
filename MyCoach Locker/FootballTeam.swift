//
//  FootballTeam.swift
//  MyCoach Locker
//
//  Created by Rplay on 03/01/2017.
//  Copyright © 2017 rplay. All rights reserved.
//

import Foundation

class FootballTeam: Team {
    var name: String
    var players: Array<Player>?
    
    init(name: String, players: Array<Player>? = nil) {
        self.name = name
        self.players = players
    }
    
    public func addPlayer(player: Player) {
        if self.players == nil {
            self.players = []
        }
        
        self.players!.append(player)
    }
    
    public func removePlayer(player: Player) {
        
        guard let playerToRemove = self.lookingForPlayer(player: player) else {
            return
        }
        
        let playerToRemoveIndex = self.players?.index(where: {$0.name == playerToRemove.name })
        
        self.players?.remove(at: playerToRemoveIndex!)
    }
    
    public func copy(with zone: NSZone? = nil) -> Any {
        
        let copy = FootballTeam(name: self.name, players: self.players)
        
        return copy
    }
    
    private func lookingForPlayer(player: Player) -> Player? {
        
        let playerIndex = self.players?.index(where: {$0.name == player.name })
        
        guard let index = playerIndex else {
            return nil
        }
        
        return self.players?[index]
    }
}
