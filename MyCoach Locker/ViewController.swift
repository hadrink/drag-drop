//
//  ViewController.swift
//  MyCoach Locker
//
//  Created by Rplay on 03/01/2017.
//  Copyright © 2017 rplay. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var compositionView: FootballCompositionView?
    var playersBenchCollectionView: PlayersBenchCollectionView?
    var playerCardViews: Array<FootballerCardView> = []
    var fakeData = FakeData()
    
    
    
    
    var draggableManager: DraggableManager?

    
    let cardSize = CGSize(width: 80, height: 120)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //TODO: Clear code
        let backgroundView = UIImageView()
        let groundImage = UIImage(named: "ground")
        backgroundView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height - cardSize.height)
        backgroundView.image = groundImage
        backgroundView.contentMode = .scaleAspectFill
        self.view.addSubview(backgroundView)
        
        
        self.compositionView = FootballCompositionView(frame: CGRect(x: 16, y: 20, width: self.view.frame.width - 32, height: self.view.frame.height - cardSize.height - 40), composition: .fourfourtwo)
        self.view.addSubview(compositionView!)
        self.playersBenchCollectionView = PlayersBenchCollectionView(frame: CGRect(x: 0, y: backgroundView.frame.height, width: self.view.frame.width, height: cardSize.height))
        
        
        
        self.view.addSubview(self.playersBenchCollectionView!)
        self.playersBenchCollectionView?.register(PlayersBenchCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
       // self.playersBenchCollectionView.
        self.playersBenchCollectionView?.delegate = self
        self.playersBenchCollectionView?.dataSource = self
        
        
        self.fillPlayerCardViews()
        
        self.draggableManager = DraggableManager(mainView: self.view)
        self.draggableManager?.delegate = self
        
        // test draggable

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func fillPlayerCardViews() {
        for player in fakeData.fakeTeam.players! {
            let playerCardView = FootballerCardView(player: player as! FootballPlayer, size: self.cardSize)
            self.playerCardViews.append(playerCardView)
        }
    }

}

extension ViewController: UICollectionViewDelegate {
    
}


extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath as IndexPath) as! PlayersBenchCollectionViewCell
        
        print(playerCardViews[indexPath.row])
        cell.footballerCardView = playerCardViews[indexPath.row]
        cell.addSubview(playerCardViews[indexPath.row])
        cell.footballerCardView?.resetPosition()
        cell.backgroundColor = UIColor.purple
        cell.frame.size = cardSize
        cell.layer.cornerRadius = 4.0
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
}

extension ViewController: DraggableManagerDelegate {
    internal func draggableViewDidCancel(draggableTouched draggableView: Draggable, draggableAreaTouched draggableArea: DraggableArea) {

    }

    func draggableViewDidDrag(draggableTouched draggableView: Draggable, draggableAreaTouched draggableArea: DraggableArea) {
        
        
        
    }
}

