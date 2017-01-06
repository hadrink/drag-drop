//
//  FootballComposition.swift
//  MyCoach Locker
//
//  Created by Rplay on 03/01/2017.
//  Copyright © 2017 rplay. All rights reserved.
//

import Foundation

enum FootballComposition: String, Composition {
    case fourfourtwo = "4-4-2"          // 4-4-2
    case fourthreetwoone = "4-3-2-1"    // 4-3-2-1
    
    func compositionPerCase() -> Array<FootballPosition> {
        switch self {
        case .fourfourtwo:
            return [.att, .att, .mg, .md, .mc, .mc, .dg, .dc, .dc, .dd, .remp, .remp, .remp, .remp, .remp]
        case .fourthreetwoone:
            return [.att, .moc, .mg]
        }
    }
    
    /** VIEW Representation
     
     --------------------------
     | A1 | A2 | A3 | A4 | A5 |
     --------------------------
     | B1 | B2 | B3 | B4 | B5 |
     --------------------------
     | C1 | C2 | C3 | C4 | C5 |
     --------------------------
     | D1 | D2 | D3 | D4 | D5 |
     --------------------------
     | E1 | E2 | E3 | E4 | E5 |
     --------------------------
     | F1 | F2 | F3 | F4 | F5 |
     --------------------------
     */
    
    func positionPerComposition() -> Dictionary<FootballPosition, FootballGridPosition> {
        switch self {
        case .fourfourtwo:
            return [.att : .A3]
        case .fourthreetwoone:
            return [.att : .A3]
        }
    }
}
