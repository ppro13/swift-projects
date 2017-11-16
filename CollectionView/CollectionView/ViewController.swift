//
//  ViewController.swift
//  CollectionView
//
//  Created by Pedro Paulo on 15/11/17.
//  Copyright © 2017 Pedro Paulo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let collectionNames: [String] = ["Eduardo Galembeck", "Rodrigo Takase", "Danilo Marshall", "Marcio Magrini", "Juan Viegas"]
    let collectionImages: [String] = ["eduardo", "rodrigo", "danilo", "marcio", "juan"]
    let collectionPositions: [String] = ["Professor iOS", "Professor iOS", "Professor iOS", "Monitor iOS", "Monitor iOS"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCard", for: indexPath) as! CollectionViewCustomCell
        
        cell.nameCard.text = collectionNames[indexPath.row]
        cell.imageCard.image = UIImage(named: collectionImages[indexPath.row])
        cell.positionCard.text = collectionPositions[indexPath.row]
        
        return cell
        
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }  
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

