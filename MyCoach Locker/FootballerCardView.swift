//
//  FootballerCardView.swift
//  MyCoach Locker
//
//  Created by Rplay on 07/01/2017.
//  Copyright © 2017 rplay. All rights reserved.
//

import Foundation
import UIKit

class FootballerCardView: UIView, Draggable {
    var player: FootballPlayer
    var name: UILabel?
    var imageView: UIImageView?
    
    init(player: FootballPlayer, size: CGSize) {
        self.player = player
        super.init(frame: CGRect(x: 0, y: 0, width: size.width , height: size.height))
        self.displayPlayerPhoto()
    }
    
    func displayPlayerPhoto() {
        guard let photo =  self.player.photoPath else {
            return
        }
        
        imageView = UIImageView()
        imageView?.frame = self.frame
        imageView?.layer.masksToBounds = true
        imageView?.contentMode = .scaleAspectFill
        imageView?.image = UIImage(named: photo)
        imageView?.layer.cornerRadius = 4.0
        self.addSubview(imageView!)
    }
    
    func setPosition(position: CGPoint) {
        
        
        self.frame.origin.x += position.x
        self.frame.origin.y += position.y
        
        print("Frame \(self.frame)")
        print("Image Frame \(self.imageView?.frame)")
        print("Card position \(position)")
    }
    
    func resetPosition() {
        self.frame.origin = CGPoint(x: 0, y: 0);
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
