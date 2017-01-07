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
     
     - Grid
     
     -----------------------------------------
     | A1 | A2 | A3 | A4 | A5 | A6 | A7 | A8 |
     -----------------------------------------
     | B1 | B2 | B3 | B4 | B5 | B6 | B7 | B8 |
     -----------------------------------------
     | C1 | C2 | C3 | C4 | C5 | C6 | C7 | C8 |
     -----------------------------------------
     | D1 | D2 | D3 | D4 | D5 | D6 | D7 | D8 |
     -----------------------------------------
     | E1 | E2 | E3 | E4 | E5 | E6 | E7 | E8 |
     -----------------------------------------
     | F1 | F2 | F3 | F4 | F5 | F6 | F7 | F8 |
     -----------------------------------------
     | G1 | G2 | G3 | G4 | G5 | G6 | G7 | G8 |
     -----------------------------------------
     | H1 | H2 | H3 | H4 | H5 | H6 | H7 | H8 |
     -----------------------------------------
     */
    
    func positionPerComposition() -> Dictionary<FootballPosition, FootballGridPosition> {
        switch self {
        case .fourfourtwo:
            return [.att : .A3, .att : .A6, .mg : .D1, .md : .D8, .mc : .E3, .mc : .E6, .dg : .F1, .dc : .G3, .dc : .G6, .dd : .F8]
        case .fourthreetwoone:
            return [.att : .A3]
        }
    }
}
