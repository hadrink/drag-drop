//
//  DraggableManagerTest.swift
//  MyCoach Locker
//
//  Created by Rplay on 29/01/2017.
//  Copyright © 2017 rplay. All rights reserved.
//

import Foundation
import UIKit

enum DraggableEventState {
    case began
    case changed
    case ended
}

class DraggableHandler {
    var oldLocation = CGPoint(x: 0, y: 0)
    var draggableManager: DraggableManagerTest

    init(view: UIView) {
        self.draggableManager = DraggableManagerTest(view: view)
        self.addLongPressGesture(onView: view)
    }
    
    func addLongPressGesture(onView view: UIView) {
        let longPressGesture = UILongPressGestureRecognizer(target: self , action: #selector(self.handleLongPress(gestureReconizer:)))
        longPressGesture.minimumPressDuration = 0.5
        view.addGestureRecognizer(longPressGesture)
    }
    
    dynamic func handleLongPress(gestureReconizer: UILongPressGestureRecognizer) {
        let state = gestureReconizer.state
        let gesturePosition = gestureReconizer.location(in: draggableManager.event.mainView)
        let gestureTranslation = CGPoint(x: gesturePosition.x - self.oldLocation.x, y: gesturePosition.y - self.oldLocation.y)
        self.oldLocation = gesturePosition
        
        switch state {
        case .began:
            self.draggableManager.handle(draggableState: .began, position: gesturePosition, translation: gestureTranslation)
        case .changed:
            self.draggableManager.handle(draggableState: .changed, position: gesturePosition, translation: gestureTranslation)
        case .ended:
            self.draggableManager.handle(draggableState: .ended, position: gesturePosition, translation: gestureTranslation)
        default:
            print("default")
        }
    }
}

class DraggableManagerTest {
    
    var event: DraggableEvent
    var viewIsSwapping: Draggable?
    var animationCompleted: Bool = true
    
    init(view: UIView) {
        self.event = DraggableEvent(mainView: view)
    }
   
    func handle(draggableState: DraggableEventState, position: CGPoint, translation: CGPoint) {
        switch draggableState {
        case .began:
            self.began(position: position)
        case .changed:
            self.changed(position: position, translation: translation)
        case .ended:
            self.ended(position: position)
        }
    }
    
    func began(position: CGPoint) {
        if self.event.activeDrag(position: position) {
            let newCenter = (self.event.viewIsDragging as! UIView).centerConvertedTo(view: self.event.mainView)
            //self.event.mainView.addSubview((self.event.viewIsDragging! as! UIView))
            //(self.event.viewIsDragging! as! UIView).center = newCenter
        }
    }
    
    func changed(position: CGPoint, translation: CGPoint) {
        
        //FIXME: Add swapped cell in cell view after animation completed
        event.drag(translation: translation, draggableView: self.event.viewIsDragging!)
        
        
        
        
        guard let viewToSwap: Draggable = self.event.draggableHitTest(pressGesturePosition: position), animationCompleted else {
            
            
            
            guard self.event.dropAreaHitTest(draggableViewPosition: position) as? UIView === self.event.oldDropArea as? UIView, self.viewIsSwapping != nil, animationCompleted else {
                return
            }
                
                self.animationCompleted = false
                DraggableAnimations.swapAnimation(draggableView: self.viewIsSwapping!, oldDropArea: self.viewIsSwapping!.dropArea!, completion: { completed, draggableViewAnimated, dropAreaAnimated in
                    self.animationCompleted = completed
                })
            
            return
        }
                
        print("View to swap \(viewToSwap)")
        
        self.animationCompleted = false
        
        
        if self.viewIsSwapping != nil {
            DraggableAnimations.swapAnimation(draggableView: self.viewIsSwapping!, oldDropArea: self.viewIsSwapping!.dropArea!, completion: { completed, draggableViewAnimated, dropAreaAnimated in
                self.animationCompleted = true
            })
        }
        
        DraggableAnimations.swapAnimation(draggableView: viewToSwap, oldDropArea: self.event.oldDropArea!, completion: { completed, draggableViewAnimated, dropAreaAnimated in
            self.animationCompleted = completed
        })
        
        
        
//        DraggableAnimations.swapAnimation(draggableView: viewToSwap, oldDropArea: self.event.oldDropArea!, completion: { completed, draggableViewAnimated, dropAreaAnimated in
//            self.event.drop(draggableView: draggableViewAnimated, draggableViewArea: dropAreaAnimated)
//        })
        
        self.viewIsSwapping = viewToSwap

    }
    
    func ended(position: CGPoint) {
        guard let viewIsDragging = self.event.viewIsDragging else {
            return
        }
        
        if let draggableViewArea = self.event.dropAreaHitTest(draggableViewPosition: (viewIsDragging as! UIView).center) {
            DraggableAnimations.dropAnimation(draggableView: viewIsDragging, dropArea: draggableViewArea, completion: { completed in
                self.event.drop(draggableView: viewIsDragging, draggableViewArea: draggableViewArea)
                //self.event.drop(draggableView: self.viewIsSwapping!, draggableViewArea: self.event.oldDropArea!)
                self.viewIsSwapping = nil
            })
            
            return
        }
        
        self.event.cancelDrop(draggableView: viewIsDragging, oldDraggableViewArea: self.event.oldDropArea)
    }
}






























