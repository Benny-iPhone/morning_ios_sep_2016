//
//  AvichaiViewController.swift
//  ImageFromServer
//
//  Created by Benny Davidovitz on 03/11/2016.
//  Copyright © 2016 xcoder.solutions. All rights reserved.
//

import UIKit
import SDWebImage

class AvichaiViewController: UIViewController {
    
    @IBOutlet weak var indicatorView: UIActivityIndicatorView!
    
    @IBOutlet weak var urlImageView: UIImageView!

    @IBAction func downloadAction(_ sender: Any) {
        urlImageView.image = nil
        
        indicatorView.startAnimating()
        
        let url = URL(string: "http://www.michiganduckrescueandsanctuary.com/wp-content/uploads/2014/12/marold_donate_transparent_504.png")!
        
        //urlImageView.sd_setImage(with: url)
        urlImageView.sd_setImage(with: url, completed: { image,error,options,url in
            //download finished
            self.indicatorView.stopAnimating()
        })
        
        //URLSession.shared.dataTask(with: url, completionHandler: (Data?, URLResponse?, Error?) -> Void)
        
        
/*
        //go to background queue
        DispatchQueue.global().async {
            guard let data = try? Data(contentsOf: url) else{
                return
            }
            
            let image = UIImage(data: data)
            //back to main queue
            DispatchQueue.main.async {
                self.urlImageView.image = image
            }
            
        }
*/
    }


}














