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
}
