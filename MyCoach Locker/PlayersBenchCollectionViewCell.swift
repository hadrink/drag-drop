//
//  PlayersBenchCollectionViewCell.swift
//  MyCoach Locker
//
//  Created by Rplay on 08/01/2017.
//  Copyright © 2017 rplay. All rights reserved.
//

import Foundation
import UIKit

class PlayersBenchCollectionViewCell: UICollectionViewCell, DropArea {
    var position: FootballPosition?
    var footballerCardView: FootballerCardView?
    var draggableView: Draggable?
    
    func setDraggableView(draggableView: Draggable) {
        self.draggableView = draggableView
        print(draggableView)
        
        guard let draggableView = draggableView as? UIView else {
            return
        }
        
        draggableView.frame.origin = CGPoint(x: 0, y: 0)
        self.addSubview(draggableView)
    }

}
