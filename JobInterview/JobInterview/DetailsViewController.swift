//
//  DetailsViewController.swift
//  JobInterview
//
//  Created by Benny Davidovitz on 01/12/2016.
//  Copyright © 2016 xcoder.solutions. All rights reserved.
//

import UIKit
import SDWebImage

protocol DetailsViewControllerDelegate {
    func detailsVC(_ controller : DetailsViewController, didFetch obj : DetailedItem)
}

class DetailsViewController: UIViewController {

    var delegate : DetailsViewControllerDelegate?
    
    @IBOutlet weak var textView : UITextView!
    @IBOutlet weak var imageView : UIImageView!
    
    var item : Item!
    var indexPath : IndexPath!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = item.title
        if let url = item.poster{
            imageView.sd_setImage(with: url)
        }
        
        //item's data already fetched
        if let obj = item as? DetailedItem{
            configure(obj)
            return
        } else {
            textView.text = nil
        }
        
        //first time fetch for this item
        guard let omdbid = item.imdbID else {
            return
        }
        APIManager.manager.fetchObject(by: omdbid) { obj,error in
        
            if let obj = obj{
                self.configure(obj)
                self.delegate?.detailsVC(self, didFetch: obj)
            } else {
                //Toast error
            }
        
        }
        
    }
    
    func configure(_ obj : DetailedItem){
        textView.text = obj.plot
    }

    

}


















