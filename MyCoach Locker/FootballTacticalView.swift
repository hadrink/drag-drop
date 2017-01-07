//
//  FootballTacticalView.swift
//  MyCoach Locker
//
//  Created by Rplay on 07/01/2017.
//  Copyright © 2017 rplay. All rights reserved.
//

import Foundation
import UIKit

class FootballTacticalView: UIView {
    var fooballCompositionView: FootballCompositionView
    var playersBenchCollectionView: PlayersBenchCollectionView
    
    init(compositionView: FootballCompositionView, playersBenchCollectionView: PlayersBenchCollectionView) {
        self.fooballCompositionView = compositionView
        self.playersBenchCollectionView = playersBenchCollectionView
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
