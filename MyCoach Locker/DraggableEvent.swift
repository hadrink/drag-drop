//
//  DraggableEvents.swift
//  MyCoach Locker
//
//  Created by Rplay on 28/01/2017.
//  Copyright © 2017 rplay. All rights reserved.
//

import Foundation
import UIKit

class DraggableEvent {
    var mainView: UIView
    var viewIsDragging: Draggable?
    var viewSwapped: Draggable?
    var viewSwappedArea: DropArea?
    var oldDropArea: DropArea?
    
    init(mainView: UIView) {
        self.mainView = mainView
    }
    
    func activeDrag(position: CGPoint) -> Bool {
        guard let viewDraggleIsTouched = self.draggableHitTest(pressGesturePosition: position) else {
            return false
        }
                
        self.viewIsDragging = viewDraggleIsTouched
        self.oldDropArea = self.dropAreaHitTest(draggableViewPosition: position)
        print("Update old drop area")
        return true
    }
    
    /** Drag a draggableView
     
    - parameter translation: New position.
    - parameter draggableView: View to Drag.
    */
    func drag(translation: CGPoint, draggableView: Draggable) {
        draggableView.setPosition(position: translation)
    }
    
    /** Drop dragglable view in a drop area
     
     - parameter draggableView: Draggable in mouvement
     - parameter draggableViewArea: The draggable view area to drop the draggable view
     */
    func drop(draggableView: Draggable, draggableViewArea: DropArea) {
        draggableViewArea.setDraggableView(draggableView: draggableView)
    }
    
    /** Called when the drop is canceled
     
     - parameter draggableView: Draggable in mouvement
     - parameter oldDraggableViewArea: The old draggable view area
     */
    func cancelDrop(draggableView: Draggable, oldDraggableViewArea: DropArea?) {
        guard let oldDraggableViewArea = oldDraggableViewArea else {
            return
        }
        
        self.drop(draggableView: draggableView, draggableViewArea: oldDraggableViewArea)
    }
    
    /** Check if a draggableView touch a dropArea
     
     - parameter draggableViewPosition: Center position of your draggableView
     
     - Returns: DropArea
     */
    func dropAreaHitTest(draggableViewPosition: CGPoint) -> DropArea? {
        let viewTouched = self.mainView.hitTest(point: draggableViewPosition, with: nil, viewToIgnore: [(self.viewIsDragging as! UIView), self.viewSwapped as? UIView])
        guard let viewTouchedAsDraggableArea = viewTouched as? DropArea else {
            return nil
        }
        
        return viewTouchedAsDraggableArea
    }
    
    /** Check if a draggableView is touched
     
     - parameter pressGesturePosition: Gesture position (CGPoint).
     
     - Returns: Draggable
     */
    func draggableHitTest(pressGesturePosition: CGPoint) -> Draggable? {
        let viewTouched = mainView.hitTest(point: pressGesturePosition, with: nil, viewToIgnore: [viewIsDragging as? UIView])
        guard let draggableView = viewTouched as? Draggable else {
            return nil
        }
        
        return draggableView
    }
    
    func dropAndReplaceDraggableView(newDraggableView: Draggable, oldDraggableView: Draggable) {
        
        (newDraggableView as! UIView).center = (newDraggableView as! UIView).superview!.convert((newDraggableView as! UIView).center, to: self.mainView)
        
        self.mainView.addSubview((newDraggableView as! UIView))
        
        let newDraggableViewCenter = (newDraggableView as! UIView).center
        let oldDraggableAreaCenter = (self.oldDropArea as! UIView).superview!.convert((self.oldDropArea as! UIView).center, to: self.mainView)
        
        UIView.animate(withDuration: 0.5, animations: {
            (newDraggableView as! UIView).center = oldDraggableAreaCenter
            (oldDraggableView as! UIView).center = newDraggableViewCenter
        }, completion: { completed in
            
            guard let draggableAreaHitByNewDraggableView = self.dropAreaHitTest(draggableViewPosition: (oldDraggableView as! UIView).center) else {
                return
            }
            
            self.drop(draggableView: oldDraggableView, draggableViewArea: draggableAreaHitByNewDraggableView)
            self.drop(draggableView: newDraggableView, draggableViewArea: self.oldDropArea!)
        })
        
    }
    
    func swap(newDraggableView: Draggable, oldDraggableView: Draggable) {
        guard let dropAreaHitByNewDraggableView = self.dropAreaHitTest(draggableViewPosition: (oldDraggableView as! UIView).center) else {
            return
        }
        
        self.drop(draggableView: oldDraggableView, draggableViewArea: dropAreaHitByNewDraggableView)
        self.drop(draggableView: newDraggableView, draggableViewArea: self.oldDropArea!)
    }
}

extension UIView {
    func centerConvertedTo(view: UIView) -> CGPoint {
        guard let superview = self.superview else {
            return CGPoint(x: 0, y: 0)
        }
        
        return superview.convert(self.center, to: view)
    }
}
