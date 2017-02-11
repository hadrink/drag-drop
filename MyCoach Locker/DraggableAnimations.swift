//
//  DraggableAnimations.swift
//  MyCoach Locker
//
//  Created by Rplay on 28/01/2017.
//  Copyright © 2017 rplay. All rights reserved.
//

import Foundation
import UIKit

extension DropArea where Self: UIView {
    func convertedCenterTo(draggableView: Draggable) -> CGPoint {
        return self.superview!.convert(self.center, to: (draggableView as! UIView).superview!)
    }
}

struct DraggableAnimations {
    
    /**
     Animation for a drop action.
     
     - parameter draggableView: View to drop.
     - parameter dropArea: Drop Area.
     - parameter completion: Called when animation is completed.
    */
    static func dropAnimation(draggableView: Draggable, dropArea: DropArea, completion: @escaping (Bool) -> ()) {
        
        //TODO: Return completion false when convertedCenterTo failed
        
        UIView.animate(withDuration: 0.5, animations: {
            (draggableView as? UIView)?.center = dropArea.convertedCenterTo(draggableView: draggableView)
        }, completion: { completed in
            completion(true)
        })
    }
    
    /**
     Animation for a cancel drop action
     
     - parameter draggableView: View to drop in old drop area.
     - parameter oldDropArea: old drop area.
     - parameter completion: Called when animation is completed.
    */
    static func cancelDropAnimation(draggableView: Draggable, oldDropArea: DropArea, completion:((Bool) -> ())?) {
        guard let oldDropAreaCenter = (oldDropArea as? UIView)?.center else {
            return
        }
        
        UIView.animate(withDuration: 0.5, animations: {
            (draggableView as? UIView)?.center = oldDropAreaCenter
        }, completion: { completed in
            completion!(true)
        })
    }
    
    /**
     Animation for a swap action.
     
     - parameter draggableView: Draggable view touched by the other draggable view.
     - parameter oldDropArea: Old drop area.
    */
    static func swapAnimation(draggableView: Draggable, oldDropArea: Draggable, completion: @escaping (Bool, _ resetPosition: CGPoint) -> ()) {
        guard let draggableViewCenterTmp = (draggableView as? UIView)?.center else {
            return
        }
        guard let oldDropAreaCenter = (oldDropArea as? UIView)?.center else {
            return
        }
        
        UIView.animate(withDuration: 0.5, animations: {
            (draggableView as? UIView)?.center = oldDropAreaCenter
        }, completion: { completed in
            completion(true, draggableViewCenterTmp)
        })
    }
    
    /**
     Animation when swap is canceled
     
     - parameter oldSwappedDraggableViewPosition: location to set on swapped draggable view.
     - parameter swappedDraggableView: The swapped draggable view.
     - parameter draggedView: The view is dragging.
     - parameter oldDropArea: old drop area.
     - parameter completion: Called when the animation is completed.
    */
    static func cancelSwapAnimation(oldSwappedDraggableViewPosition: CGPoint, swappedDraggableView: Draggable, draggedView: Draggable, oldDropArea: DropArea, completion: @escaping (Bool) ->()) {
        self.cancelDropAnimation(draggableView: draggedView, oldDropArea: oldDropArea, completion: nil)
        UIView.animate(withDuration: 0.5, animations: {
            (swappedDraggableView as? UIView)?.center = oldSwappedDraggableViewPosition
        }, completion: { completed in
            completion(true)
        })
    }
}
