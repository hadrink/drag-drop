//
//  fakeData.swift
//  MyCoach Locker
//
//  Created by Rplay on 08/01/2017.
//  Copyright © 2017 rplay. All rights reserved.
//

import Foundation

class FakeData {
    
    private var fakePlayers: Array<FootballPlayer>
    var fakeTeam: FootballTeam
    
    init() {
        let footballPlayer1 = FootballPlayer(name: "Mario", age: 24, positions: [FootballPosition.att])
        footballPlayer1.photoPath = "balo"
        let footballPlayer2 = FootballPlayer(name: "Rémy", age: 26, positions: [FootballPosition.att])
        footballPlayer2.photoPath = "lebihan"
        let footballPlayer3 = FootballPlayer(name: "Paul", age: 26, positions: [FootballPosition.att])
        footballPlayer3.photoPath = "plea"
        let footballPlayer4 = FootballPlayer(name: "Robert", age: 26, positions: [FootballPosition.mg])
        let footballPlayer5 = FootballPlayer(name: "Marc", age: 28, positions: [FootballPosition.mg])
        let footballPlayer6 = FootballPlayer(name: "Kévin", age: 28, positions: [FootballPosition.md])
        let footballPlayer7 = FootballPlayer(name: "Martin", age: 19, positions: [FootballPosition.md])
        let footballPlayer8 = FootballPlayer(name: "Martin", age: 19, positions: [FootballPosition.mc])
        let footballPlayer9 = FootballPlayer(name: "Thomas", age: 19, positions: [FootballPosition.mc])
        let footballPlayer10 = FootballPlayer(name: "Martin", age: 19, positions: [FootballPosition.mc])
        let footballPlayer11 = FootballPlayer(name: "Jean-Kévin", age: 19, positions: [FootballPosition.mc])
        let footballPlayer12 = FootballPlayer(name: "Bastien", age: 19, positions: [FootballPosition.dg])
        let footballPlayer13 = FootballPlayer(name: "Mamad'", age: 19, positions: [FootballPosition.dg])
        let footballPlayer14 = FootballPlayer(name: "Momo", age: 19, positions: [FootballPosition.dc])
        let footballPlayer15 = FootballPlayer(name: "Abdel", age: 19, positions: [FootballPosition.dc])
        let footballPlayer16 = FootballPlayer(name: "Michel", age: 19, positions: [FootballPosition.dc])
        let footballPlayer17 = FootballPlayer(name: "Philippe", age: 19, positions: [FootballPosition.dc])
        let footballPlayer18 = FootballPlayer(name: "Romain", age: 19, positions: [FootballPosition.dd])
        let footballPlayer19 = FootballPlayer(name: "Jérémy", age: 19, positions: [FootballPosition.dd])
        let footballPlayer20 = FootballPlayer(name: "Raymond", age: 19, positions: [FootballPosition.att])
        let footballPlayer21 = FootballPlayer(name: "Mathieu", age: 19, positions: [FootballPosition.mc])
        let footballPlayer22 = FootballPlayer(name: "Tristan", age: 19, positions: [FootballPosition.mg])
        let footballPlayer23 = FootballPlayer(name: "David", age: 19, positions: [FootballPosition.md])
        
        self.fakePlayers = [footballPlayer1, footballPlayer2, footballPlayer3, footballPlayer4, footballPlayer5, footballPlayer6, footballPlayer7, footballPlayer8, footballPlayer9, footballPlayer10, footballPlayer11, footballPlayer12, footballPlayer13, footballPlayer14, footballPlayer15, footballPlayer16, footballPlayer17, footballPlayer18, footballPlayer19, footballPlayer20, footballPlayer21, footballPlayer22, footballPlayer23]
        
        self.fakeTeam = FootballTeam(name: "OGC Fake", players: self.fakePlayers)
    }
    
    
}
