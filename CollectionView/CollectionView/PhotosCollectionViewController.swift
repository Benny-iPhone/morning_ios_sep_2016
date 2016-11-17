//
//  PhotosCollectionViewController.swift
//  CollectionView
//
//  Created by Benny Davidovitz on 17/11/2016.
//  Copyright © 2016 hackeru . All rights reserved.
//

import UIKit
import DKImagePickerController

class PhotosCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    var collectionArray : [UIImage] = []
    
    func cellSize() -> CGSize{
        let size = view.bounds.width / 3.1
        return CGSize(width: size, height: size)
    }

    //MARK: - IBAction

    func handle(asset : DKAsset){
        let imageSize = cellSize()
        
        asset.fetchImageWithSize(imageSize, completeBlock: { (image, _) in
            if let image = image{
                self.collectionArray.insert(image, at: 0)
                let indexPath = IndexPath(item: 0, section: 0)
                self.collectionView?.insertItems(at: [indexPath])
            }
        })
    }
    
    @IBAction func addPhotosAction(_ sender: Any) {
        //add NSPhotoLibraryUsageDescription to your info.plist file
        
        let pickerController = DKImagePickerController()
        pickerController.didSelectAssets = { assets in //[DKAssets]
            for item in assets{
                self.handle(asset: item)
            }
        }
        
        present(pickerController, animated: true, completion: nil)
    }
    
    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionArray.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let identifier = PhotoCell.identifier
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! PhotoCell
    
        // Configure the cell
        cell.configure(with: collectionArray[indexPath.item])
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return cellSize()
    }

}










