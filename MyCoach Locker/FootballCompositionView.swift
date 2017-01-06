//
//  CompositionView.swift
//  MyCoach Locker
//
//  Created by Rplay on 06/01/2017.
//  Copyright © 2017 rplay. All rights reserved.
//

import Foundation
import UIKit

class FootballCompositionView: UIView {
    var composition: FootballComposition
    
    init(frame: CGRect, composition: FootballComposition) {
        self.composition = composition
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func positionOnGrid(compositionView: UIView, positionOnGrid: FootballGridPosition) -> CGPoint {
        let viewHeight = compositionView.frame.height
        let viewWidth  = compositionView.frame.width
        
        let nbLine: CGFloat   = 6
        let nbColumn: CGFloat = 5
        
        let lineHeight  = viewHeight / nbLine
        let columnWidth = viewWidth / nbColumn
        
        let blockHeight      = lineHeight
        let blockWidth       = columnWidth
        let blockWidthCenter = blockWidth / 2
        
        switch positionOnGrid {
        case .A1:
            return CGPoint(x: blockWidth - blockWidthCenter , y: blockHeight)
        case .A2:
            return CGPoint(x: (blockWidth * 2) - blockWidthCenter , y: blockHeight)
        case .A3:
            return CGPoint(x: (blockWidth * 3) - blockWidthCenter , y: blockHeight)
        case .A4:
            return CGPoint(x: (blockWidth * 4) - blockWidthCenter , y: blockHeight)
        case .A5:
            return CGPoint(x: (blockWidth * 5) - blockWidthCenter , y: blockHeight)
        case .B1:
            return CGPoint(x: blockWidth - blockWidthCenter , y: blockHeight * 2)
        case .B2:
            return CGPoint(x: (blockWidth * 2) - blockWidthCenter , y: blockHeight * 2)
        case .B3:
            return CGPoint(x: (blockWidth * 3) - blockWidthCenter , y: blockHeight * 2)
        case .B4:
            return CGPoint(x: (blockWidth * 4) - blockWidthCenter , y: blockHeight * 2)
        case .B5:
            return CGPoint(x: (blockWidth * 5) - blockWidthCenter , y: blockHeight * 2)
        case .C1:
            return CGPoint(x: blockWidth - blockWidthCenter , y: blockHeight * 3)
        case .C2:
            return CGPoint(x: (blockWidth * 2) - blockWidthCenter , y: blockHeight * 3)
        case .C3:
            return CGPoint(x: (blockWidth * 3) - blockWidthCenter , y: blockHeight * 3)
        case .C4:
            return CGPoint(x: (blockWidth * 4) - blockWidthCenter , y: blockHeight * 3)
        case .C5:
            return CGPoint(x: (blockWidth * 5) - blockWidthCenter , y: blockHeight * 3)
        case .D1:
            return CGPoint(x: blockWidth - blockWidthCenter , y: blockHeight * 4)
        case .D2:
            return CGPoint(x: (blockWidth * 2) - blockWidthCenter , y: blockHeight * 4)
        case .D3:
            return CGPoint(x: (blockWidth * 3) - blockWidthCenter , y: blockHeight * 4)
        case .D4:
            return CGPoint(x: (blockWidth * 4) - blockWidthCenter , y: blockHeight * 4)
        case .D5:
            return CGPoint(x: (blockWidth * 5) - blockWidthCenter , y: blockHeight * 4)
        case .E1:
            return CGPoint(x: blockWidth - blockWidthCenter , y: blockHeight * 5)
        case .E2:
            return CGPoint(x: (blockWidth * 2) - blockWidthCenter , y: blockHeight * 5)
        case .E3:
            return CGPoint(x: (blockWidth * 3) - blockWidthCenter , y: blockHeight * 5)
        case .E4:
            return CGPoint(x: (blockWidth * 4) - blockWidthCenter , y: blockHeight * 5)
        case .E5:
            return CGPoint(x: (blockWidth * 5) - blockWidthCenter , y: blockHeight * 5)
        case .F1:
            return CGPoint(x: blockWidth - blockWidthCenter , y: blockHeight * 6)
        case .F2:
            return CGPoint(x: (blockWidth * 2) - blockWidthCenter , y: blockHeight * 6)
        case .F3:
            return CGPoint(x: (blockWidth * 3) - blockWidthCenter , y: blockHeight * 6)
        case .F4:
            return CGPoint(x: (blockWidth * 4) - blockWidthCenter , y: blockHeight * 6)
        case .F5:
            return CGPoint(x: (blockWidth * 5) - blockWidthCenter , y: blockHeight * 6)
        }
    }
}
