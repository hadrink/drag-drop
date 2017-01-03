//
//  FootballTactical.swift
//  MyCoach Locker
//
//  Created by Rplay on 03/01/2017.
//  Copyright © 2017 rplay. All rights reserved.
//

import Foundation

class FootballTactical: Tactical {
    var team: Team
    var composition: Composition
    var playersPosition: Dictionary<String, Array<Player>>
    
    init(team: Team, composition: Composition) {
        self.team = team
        self.composition = composition
        self.playersPosition = [:]
        self.updatePlayersPosition(players: team.players!)
    }
    
    func switchComposition(composition: Composition) {
        self.composition = composition
    }
    
    func switchPlayer(player1: Player?, player2: Player?) {
        for(position, playersArray) in playersPosition {
            for player in playersArray {
                if player.name == player1?.name {
                    playersPosition[position]?.append(player2!)
                    let index = playersPosition[position]?.index(where: {$0.name == player1?.name})
                    playersPosition[position]?.remove(at: index!)
                }
                
                if player.name == player2?.name {
                    playersPosition[position]?.append(player1!)
                    let index = playersPosition[position]?.index(where: {$0.name == player2?.name})
                    playersPosition[position]?.remove(at: index!)
                }
            }
        }
    }
    
    private func updatePlayersPosition(players: Array<Player>) {
        let composition = self.composition as! FootballComposition
        let allPlacementsInComposition = composition.compositionPerCase()
        let footballTeam: FootballTeam = self.team as! FootballTeam
        
        var players: Array<FootballPlayer> = footballTeam.players as! Array<FootballPlayer>
        
        for aPlacement in allPlacementsInComposition {
            switch aPlacement {
            case .att:
                guard let playerToAdd = pickAPlayerPerPosition(position: .att, team: players) else {
                    break
                }
                
                addplayerPerPosition(position: .att, footballPlayer: playerToAdd)
                players = removePickedPlayerFromAnArray(playerToRemove: playerToAdd, players: players)
                
            case .moc:
                guard let playerToAdd = pickAPlayerPerPosition(position: .moc, team: players) else {
                    break
                }
                
                addplayerPerPosition(position: .moc, footballPlayer: playerToAdd)
                players = removePickedPlayerFromAnArray(playerToRemove: playerToAdd, players: players)
                
            case .mc:
                guard let playerToAdd = pickAPlayerPerPosition(position: .mc, team: players) else {
                    break
                }
                
                addplayerPerPosition(position: .mc, footballPlayer: playerToAdd)
                players = removePickedPlayerFromAnArray(playerToRemove: playerToAdd, players: players)
                
            case .mod:
                guard let playerToAdd = pickAPlayerPerPosition(position: .mod, team: players) else {
                    break
                }
                
                addplayerPerPosition(position: .mod, footballPlayer: playerToAdd)
                players = removePickedPlayerFromAnArray(playerToRemove: playerToAdd, players: players)
                
            case .mog:
                guard let playerToAdd = pickAPlayerPerPosition(position: .mog, team: players) else {
                    break
                }
                
                addplayerPerPosition(position: .mog, footballPlayer: playerToAdd)
                players = removePickedPlayerFromAnArray(playerToRemove: playerToAdd, players: players)
                
            case .mg:
                guard let playerToAdd = pickAPlayerPerPosition(position: .mg, team: players) else {
                    break
                }
                
                addplayerPerPosition(position: .mg, footballPlayer: playerToAdd)
                players = removePickedPlayerFromAnArray(playerToRemove: playerToAdd, players: players)
                
            case .md:
                guard let playerToAdd = pickAPlayerPerPosition(position: .md, team: players) else {
                    break
                }
                
                addplayerPerPosition(position: .md, footballPlayer: playerToAdd)
                players = removePickedPlayerFromAnArray(playerToRemove: playerToAdd, players: players)
                
            case .dg:
                guard let playerToAdd = pickAPlayerPerPosition(position: .dg, team: players) else {
                    break
                }
                
                addplayerPerPosition(position: .dg, footballPlayer: playerToAdd)
                players = removePickedPlayerFromAnArray(playerToRemove: playerToAdd, players: players)
                
            case .dc:
                guard let playerToAdd = pickAPlayerPerPosition(position: .dc, team: players) else {
                    break
                }
                
                addplayerPerPosition(position: .dc, footballPlayer: playerToAdd)
                players = removePickedPlayerFromAnArray(playerToRemove: playerToAdd, players: players)
                
            case .dd:
                guard let playerToAdd = pickAPlayerPerPosition(position: .dd, team: players) else {
                    break
                }
                
                addplayerPerPosition(position: .dd, footballPlayer: playerToAdd)
                players = removePickedPlayerFromAnArray(playerToRemove: playerToAdd, players: players)
                
            case .remp:
                guard let playerToAdd = pickAPlayerPerPosition(position: nil, team: players) else {
                    break
                }
                
                addplayerPerPosition(position: .remp, footballPlayer: playerToAdd)
                players = removePickedPlayerFromAnArray(playerToRemove: playerToAdd, players: players)
            }
        }
    }
    
    
    private func pickAPlayerPerPosition(position: FootballPosition?, team: Array<FootballPlayer>) -> FootballPlayer? {
        for footballPlayer in team {
            if position == nil {
                print("I'm nil")
                return footballPlayer
            } else   {
                for footballerPosition in footballPlayer.positions {
                    if footballerPosition as? FootballPosition == position { return footballPlayer }
                }
            }
        }
        
        return nil
    }
    
    private func removePickedPlayerFromAnArray(playerToRemove: FootballPlayer, players: Array<FootballPlayer>) -> Array<FootballPlayer> {
        var players = players
        guard let index = players.index(where: {$0.name == playerToRemove.name}) else {
            print("No player found")
            return players
        }
        
        players.remove(at: index)
        
        return players
    }
    
    private func addplayerPerPosition(position: FootballPosition, footballPlayer: FootballPlayer) {
        playersPosition[position.rawValue] == nil ?
        playersPosition[position.rawValue] = [footballPlayer] :
        playersPosition[position.rawValue]?.append(footballPlayer)
    }
    
    private func countsPositionInComposition() -> Dictionary<FootballPosition, Int> {
        let composition = self.composition as! FootballComposition
        let allPositionsInComposition = composition.compositionPerCase()
        
        var counts:[FootballPosition:Int] = [:]
        
        for position in allPositionsInComposition {
            counts[position] = (counts[position] ?? 0) + 1
        }
        
        return counts
    }
}
