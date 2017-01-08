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
    var playersContainer: Array<FootballerContainerView>?
    
    init(frame: CGRect, composition: FootballComposition) {
        self.composition = composition
        super.init(frame: frame)
        self.displayContainersOnView()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func displayContainersOnView() {
        let positionPerComposition = composition.positionPerComposition()
        
        for position in positionPerComposition {
            let footballPosition = position.key
            let footballGridPositions = position.value
            
            for footballGridPosition in footballGridPositions {
                let footballContainerViewPosition = positionOnGrid(compositionView: self, positionOnGrid: footballGridPosition)
                let footballContainerViewFrame = CGRect(x: footballContainerViewPosition.x, y: footballContainerViewPosition.y, width: 0, height: 0)
                let footballerContainerView = FootballerContainerView(frame: footballContainerViewFrame, position: footballPosition, player: nil)
                
                self.playersContainer == nil ? self.playersContainer = [footballerContainerView] : self.playersContainer?.append(footballerContainerView)
                self.addSubview(footballerContainerView)
            }
        }
    }
    
    
    func positionOnGrid(compositionView: UIView, positionOnGrid: FootballGridPosition) -> CGPoint {
        let viewHeight = compositionView.frame.height
        let viewWidth  = compositionView.frame.width
        
        let nbLine: CGFloat   = 8
        let nbColumn: CGFloat = 8
        
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
        case .A6:
            return CGPoint(x: (blockWidth * 6) - blockWidthCenter , y: blockHeight)
        case .A7:
            return CGPoint(x: (blockWidth * 7) - blockWidthCenter , y: blockHeight)
        case .A8:
            return CGPoint(x: (blockWidth * 8) - blockWidthCenter , y: blockHeight)
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
        case .B6:
            return CGPoint(x: (blockWidth * 6) - blockWidthCenter , y: blockHeight * 2)
        case .B7:
            return CGPoint(x: (blockWidth * 7) - blockWidthCenter , y: blockHeight * 2)
        case .B8:
            return CGPoint(x: (blockWidth * 8) - blockWidthCenter , y: blockHeight * 2)
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
        case .C6:
            return CGPoint(x: (blockWidth * 6) - blockWidthCenter , y: blockHeight * 3)
        case .C7:
            return CGPoint(x: (blockWidth * 7) - blockWidthCenter , y: blockHeight * 3)
        case .C8:
            return CGPoint(x: (blockWidth * 8) - blockWidthCenter , y: blockHeight * 3)
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
        case .D6:
            return CGPoint(x: (blockWidth * 6) - blockWidthCenter , y: blockHeight * 4)
        case .D7:
            return CGPoint(x: (blockWidth * 7) - blockWidthCenter , y: blockHeight * 4)
        case .D8:
            return CGPoint(x: (blockWidth * 8) - blockWidthCenter , y: blockHeight * 4)
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
        case .E6:
            return CGPoint(x: (blockWidth * 6) - blockWidthCenter , y: blockHeight * 5)
        case .E7:
            return CGPoint(x: (blockWidth * 7) - blockWidthCenter , y: blockHeight * 5)
        case .E8:
            return CGPoint(x: (blockWidth * 8) - blockWidthCenter , y: blockHeight * 5)
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
        case .F6:
            return CGPoint(x: (blockWidth * 6) - blockWidthCenter , y: blockHeight * 6)
        case .F7:
            return CGPoint(x: (blockWidth * 7) - blockWidthCenter , y: blockHeight * 6)
        case .F8:
            return CGPoint(x: (blockWidth * 8) - blockWidthCenter , y: blockHeight * 6)
        case .G1:
            return CGPoint(x: blockWidth - blockWidthCenter , y: blockHeight * 7)
        case .G2:
            return CGPoint(x: (blockWidth * 2) - blockWidthCenter , y: blockHeight * 7)
        case .G3:
            return CGPoint(x: (blockWidth * 3) - blockWidthCenter , y: blockHeight * 7)
        case .G4:
            return CGPoint(x: (blockWidth * 4) - blockWidthCenter , y: blockHeight * 7)
        case .G5:
            return CGPoint(x: (blockWidth * 5) - blockWidthCenter , y: blockHeight * 7)
        case .G6:
            return CGPoint(x: (blockWidth * 6) - blockWidthCenter , y: blockHeight * 7)
        case .G7:
            return CGPoint(x: (blockWidth * 5) - blockWidthCenter , y: blockHeight * 7)
        case .G8:
            return CGPoint(x: (blockWidth * 5) - blockWidthCenter , y: blockHeight * 7)
        case .H1:
            return CGPoint(x: blockWidth - blockWidthCenter , y: blockHeight * 8)
        case .H2:
            return CGPoint(x: (blockWidth * 2) - blockWidthCenter , y: blockHeight * 8)
        case .H3:
            return CGPoint(x: (blockWidth * 3) - blockWidthCenter , y: blockHeight * 8)
        case .H4:
            return CGPoint(x: compositionView.frame.width / 2 , y: blockHeight * 8)
        case .H5:
            return CGPoint(x: compositionView.frame.width / 2 , y: blockHeight * 8)
        case .H6:
            return CGPoint(x: (blockWidth * 6) - blockWidthCenter , y: blockHeight * 8)
        case .H7:
            return CGPoint(x: (blockWidth * 5) - blockWidthCenter , y: blockHeight * 8)
        case .H8:
            return CGPoint(x: (blockWidth * 5) - blockWidthCenter , y: blockHeight * 8)
        }
    }
}
