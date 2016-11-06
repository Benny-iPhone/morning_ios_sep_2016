//
//  GallertCollectionViewController.swift
//  Gallery
//
//  Created by Benny Davidovitz on 03/11/2016.
//  Copyright © 2016 xcoder.solutions. All rights reserved.
//

import UIKit
import SDWebImage

private let reuseIdentifier = "Cell"

class GallertCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    let collectionArray : [String] = [
        "http://www.alsglobal.com/~/media/Images/Divisions/Life%20Sciences/Food/ALS-Food-Hero.jpg",
        "https://upload.wikimedia.org/wikipedia/commons/6/6d/Good_Food_Display_-_NCI_Visuals_Online.jpg",
        "http://s3.amazonaws.com/etntmedia/media/images/ext/842849976/greasy-fast-food.jpg",
        "https://static.pexels.com/photos/5317/food-salad-restaurant-person.jpg"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Delete this, we are using storyboard's cell
        // Register cell classes
        //self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

    }


    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionArray.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! GalleryCollectionViewCell
    
        // Configure the cell
        let url = URL(string: collectionArray[indexPath.item])
        cell.imageView.sd_setImage(with: url)
        
        
        return cell
    }

    // MARK: UICollectionViewDelegate

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return collectionView.bounds.size
        
    }
}











