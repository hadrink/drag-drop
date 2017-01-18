//
//  FootballerContainerView.swift
//  MyCoach Locker
//
//  Created by Rplay on 07/01/2017.
//  Copyright © 2017 rplay. All rights reserved.
//

import Foundation
import UIKit

class FootballerContainerView: UIView, DraggableArea {
    var player: FootballerCardView?
    var position: FootballPosition
    var draggableView: Draggable?
    
    init(frame: CGRect, position: FootballPosition, player: FootballerCardView?) {
        self.player = player
        self.position = position
        super.init(frame: frame)
        self.designView()
    }
    
    func designView() {
        self.frame.size.width  = 80
        self.frame.size.height = 120
        self.frame.origin.x -= self.frame.width / 2
        self.frame.origin.y -= self.frame.height
        self.backgroundColor = UIColor.black
        self.layer.cornerRadius = 4.0
    }
    
    func setDraggableView(draggableView: Draggable) {
        self.draggableView = draggableView
        
        guard let draggableView = draggableView as? UIView else {
            return
        }
        
        draggableView.frame.origin = CGPoint(x: 0, y: 0)
        self.addSubview(draggableView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
