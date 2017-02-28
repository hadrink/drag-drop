//
//  DraggableView.swift
//  MyCoach Locker
//
//  Created by Rplay on 11/01/2017.
//  Copyright © 2017 rplay. All rights reserved.
//

import Foundation
import UIKit

protocol Draggable {
    var dropArea: DropArea? { get set }
    func setDropArea(dropArea: DropArea)
    func setPosition(position: CGPoint)
}
