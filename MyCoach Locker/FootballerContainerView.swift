//
//  FootballerContainerView.swift
//  MyCoach Locker
//
//  Created by Rplay on 07/01/2017.
//  Copyright © 2017 rplay. All rights reserved.
//

import Foundation
import UIKit

class FootballerContainerView: UIView {
    var player: FootballerCardView?
    var position: FootballPosition
    
    init(frame: CGRect, position: FootballPosition, player: FootballerCardView?) {
        self.player = player
        self.position = position
        super.init(frame: frame)
        self.designView()
    }
    
    func designView() {
        self.frame.size.width  = 80
        self.frame.size.height = 120
        self.frame.origin.x  -= self.frame.width / 2
        self.frame.origin.y -= self.frame.height
        self.backgroundColor = UIColor.black
        self.layer.cornerRadius = 4.0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
