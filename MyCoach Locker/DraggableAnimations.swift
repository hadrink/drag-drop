//
//  DraggableAnimations.swift
//  MyCoach Locker
//
//  Created by Rplay on 28/01/2017.
//  Copyright © 2017 rplay. All rights reserved.
//

import Foundation
import UIKit

struct DraggableAnimations {
    
    /**
     Animation for a drop action.
     
     - parameter draggableView: View to drop.
     - parameter dropArea: Drop Area.
     - parameter completion: Called when animation is completed.
    */
    func dropAnimation(draggableView: Draggable, dropArea: DropArea, completion: @escaping (Bool) -> ()) {
        UIView.animate(withDuration: 0.5, animations: {
            (draggableView as? UIView)?.center = (dropArea as? UIView)!.center
        }, completion: { completed in
            completion(true)
        })
    }
}
