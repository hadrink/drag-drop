//
//  PlayersBenchCollectionView.swift
//  MyCoach Locker
//
//  Created by Rplay on 07/01/2017.
//  Copyright © 2017 rplay. All rights reserved.
//

import Foundation
import UIKit

class PlayersBenchCollectionView: UICollectionView {
    
    init(frame: CGRect) {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 10
        layout.itemSize = CGSize(width: 60, height: 100)
        layout.scrollDirection = .horizontal
        super.init(frame: frame, collectionViewLayout: layout)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
