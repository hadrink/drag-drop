//
//  DraggableManager.swift
//  MyCoach Locker
//
//  Created by Rplay on 11/01/2017.
//  Copyright © 2017 rplay. All rights reserved.
//

import Foundation
import UIKit


protocol DraggableManagerDelegate {
    func draggableViewDidDrag(draggableTouched draggableView: Draggable, draggableAreaTouched draggableArea: DraggableArea)
    func draggableViewDidCancel(draggableTouched draggableView: Draggable, draggableAreaTouched draggableArea: DraggableArea)
}

class DraggableManager {
    var mainView: UIView
    var viewIsDragging: Draggable?
    var oldLocation = CGPoint(x: 0, y: 0)
    var delegate: DraggableManagerDelegate?
    var positionViewAtStart: CGPoint?
    var longPressGestureRecognizer: UILongPressGestureRecognizer
    var oldDraggableViewArea: DraggableArea?

    
    init(mainView: UIView) {
        self.mainView = mainView
        self.longPressGestureRecognizer = UILongPressGestureRecognizer()
        self.longPressGestureRecognizer = UILongPressGestureRecognizer(target: self , action: #selector(handleLongPress))
        self.mainView.addGestureRecognizer(self.longPressGestureRecognizer)
        longPressGestureRecognizer.minimumPressDuration = 0.5
    }
    
    func activeDrag(gesturePosition: CGPoint) {
        guard let viewDraggleIsTouched = self.checkDraggableViewIsTouched(pressGesturePosition: gesturePosition) else {
            return
        }
        
        
        self.viewIsDragging = viewDraggleIsTouched
        let newCenter = (viewDraggleIsTouched as! UIView).convert((viewDraggleIsTouched as! UIView).center, to: self.mainView)
        self.mainView.addSubview((viewDraggleIsTouched as! UIView))
        (viewDraggleIsTouched as! UIView).center = newCenter
    }
    
    func handleDrag(gestureTranslation: CGPoint, draggableView: Draggable) {
        draggableView.setPosition(position: gestureTranslation)
    }
    
    func endDrag() {
        guard let viewIsDragging = self.viewIsDragging else {
            return
        }
        
        if let draggableViewArea = self.checkDraggleViewHintDragglableArea(draggableViewPosition: (viewIsDragging as! UIView).center) {
            self.oldDraggableViewArea = self.dropInDraggableArea(draggableView: viewIsDragging, draggableViewArea: draggableViewArea)
            self.viewIsDragging = nil
            return
        } else {
            self.dropIsCanceled(draggableView: viewIsDragging, oldDraggableViewArea: self.oldDraggableViewArea)
            self.viewIsDragging = nil
        }
        
        
        
        /*if let draggableView = self.checkDraggableViewIsTouched(pressGesturePosition: (viewIsDragging as! UIView).center) {
            
            self.dropAndReplaceDraggableView(newDraggableView: draggableView, oldDraggableView: viewIsDragging)
            self.dropAndReplaceDraggableView(newDraggableView: viewIsDragging, oldDraggableView: draggableView)
            self.viewIsDragging = nil
            return
        }*/
    }
    
    /** Drop dragglable view in a draggable area
     
    - parameter draggableView: Draggable in mouvement
    - parameter draggableViewArea: The draggable view area to drop the draggable view
    
    - Returns: DraggableArea
    */
    func dropInDraggableArea(draggableView: Draggable, draggableViewArea: DraggableArea) -> DraggableArea {
        UIView.animate(withDuration: 0.5, animations: {
            (draggableView as! UIView).center = (draggableViewArea as! UIView).superview!.convert((draggableViewArea as! UIView).center, to: self.mainView)
        }, completion: { completed in
            (draggableView as! UIView).removeFromSuperview()
            draggableViewArea.setDraggableView(draggableView: draggableView)
        })
        
        return draggableViewArea
    }
    
    func dropAndReplaceDraggableView(newDraggableView: Draggable, oldDraggableView: Draggable) {
        UIView.animate(withDuration: 0.5, animations: {
            (newDraggableView as! UIView).frame.origin = (oldDraggableView as! UIView).superview!.convert((oldDraggableView as! UIView).frame.origin, to: self.mainView)
        }, completion: { completed in
            
            guard let draggableArea = (oldDraggableView as! UIView).superview as? DraggableArea else {
                return
            }
            
            (newDraggableView as! UIView).removeFromSuperview()
            draggableArea.setDraggableView(draggableView: newDraggableView)
            
        })
    }
    
    /** Called when the drop is canceled 
    
    - parameter draggableView: Draggable in mouvement
    - parameter oldDraggableViewArea: The old draggable view area
     
    - Returns: DraggableArea
    */
    func dropIsCanceled(draggableView: Draggable, oldDraggableViewArea: DraggableArea?) {
        guard let oldDraggableViewArea = oldDraggableViewArea else {
            UIView.animate(withDuration: 0.5, animations: {
                (draggableView as! UIView).frame.origin = self.getPositionViewAtStart()!
            }, completion: { completed in
                (draggableView as! UIView).frame.origin = self.getPositionViewAtStart()!
            })
            
            return
        }
        
        self.oldDraggableViewArea = self.dropInDraggableArea(draggableView: draggableView, draggableViewArea: oldDraggableViewArea)
    }
    
    /** Check if a draggableView touch a draggableArea
     
     parameter:
        - draggableViewPosition: Center position of your draggableView
    */
    
    func checkDraggleViewHintDragglableArea(draggableViewPosition: CGPoint) -> DraggableArea? {
        for view in self.mainView.subviews {
            let viewTouched = view.hitTest(draggableViewPosition, with: nil)
            guard let viewTouchedAsDraggableArea = viewTouched as? DraggableArea else {
                continue
            }
            
            return viewTouchedAsDraggableArea
        }
        
        return nil
    }
    
    /** Check if a draggableView is touched
     
    - parameter pressGesturePosition: Gesture position (CGPoint).
    
    - Returns: Draggable
    */
    func checkDraggableViewIsTouched(pressGesturePosition: CGPoint) -> Draggable? {
        let viewTouched = mainView.hitTest(point: pressGesturePosition, with: nil, viewToIgnore: viewIsDragging as? UIView)
        print("Press gesture at start \(viewTouched)")
        guard let draggableView = viewTouched as? Draggable else {
            return nil
        }
        
        return draggableView
    }
    
    
    func getPositionViewAtStart() -> CGPoint? {
        guard let positionViewAtStart = self.positionViewAtStart else {
            return nil
        }
        
        return positionViewAtStart
    }
    
    func savePositionViewAtStart(position: CGPoint) {
        self.positionViewAtStart = position
    }
    
    @objc func handleLongPress(gestureReconizer: UILongPressGestureRecognizer) {
        let state = gestureReconizer.state
        let gesturePosition = gestureReconizer.location(in: self.mainView)
        let gestureTranslation = CGPoint(x: gesturePosition.x - self.oldLocation.x, y: gesturePosition.y - self.oldLocation.y)
        self.oldLocation = gesturePosition
        
        switch state {
        case .began:
            self.activeDrag(gesturePosition: gesturePosition)
        case .changed:
            guard let viewIsDragging = self.viewIsDragging else {
                return
            }
            
            self.handleDrag(gestureTranslation: gestureTranslation, draggableView: viewIsDragging)
        case .ended:
            self.endDrag()
        default:
            self.viewIsDragging = nil
        }
    }
    
}

extension UIView {
    
    /** Return view touched at CGpoint position
     
    - parameter point: A position.
    - parameter event: An event.
    - parameter viewToIgnore: A view to ignore.
     
    - Returns: UIView
    */
    func hitTest(point: CGPoint, with event: UIEvent?, viewToIgnore: UIView?) -> UIView? {
        guard let viewToIgnore = viewToIgnore else {
            return self.hitTest(point, with: event)
        }
        
        viewToIgnore.isUserInteractionEnabled = false
        let viewFound = self.hitTest(point, with: event)
        viewToIgnore.isUserInteractionEnabled = true
        
        return viewFound
    }
}

