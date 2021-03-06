//
//  DraggableArea.swift
//  MyCoach Locker
//
//  Created by Rplay on 11/01/2017.
//  Copyright © 2017 rplay. All rights reserved.
//

import Foundation
import UIKit

protocol DropArea {
    var draggableView: Draggable? { get set }    
    func setDraggableView(draggableView: Draggable)
    func convertedCenterTo(draggableView: Draggable) -> CGPoint
}

