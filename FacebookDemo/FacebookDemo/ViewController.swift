//
//  ViewController.swift
//  FacebookDemo
//
//  Created by Benny Davidovitz on 12/12/2016.
//  Copyright © 2016 xcoder.solutions. All rights reserved.
//

import UIKit
import FacebookShare
import FacebookCore
import SDWebImage
//import Photos

class ViewController: UIViewController {

    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var profilePicImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let userId = AccessToken.current?.userId
        print(AccessToken.current!.authenticationToken)
        print(userId ?? "")
        let connection = GraphRequestConnection()
        let params = [
            "fields":"id,name,first_name,last_name,cover,birthday,gender,picture,email"
        ]
        let request = GraphRequest(graphPath: "/me", parameters: params)
        
        connection.add(request) { httpResponse, result in
            switch result {
            case .success(let response):
                print("Graph Request Succeeded: \(response)")
                if let data = response.dictionaryValue{
                    self.handleMe(data: data)
                }
            case .failed(let error):
                print("Graph Request Failed: \(error)")
            }
        }
        connection.start()
    }
    
    func handleMe(data : [String:Any]){
        let name = data["name"] as? String
        
        nameLabel.text = name
        
        coverImageView.contentMode = .scaleToFill
        
        if let cover = data["cover"] as? [String:Any],
            let urlString = cover["source"] as? String,
            let url = URL(string: urlString){
            //load cover photo
            
            coverImageView.sd_setImage(with: url)
        }
        /*
        if let picture = data["picture"] as? [String:Any],
        let pData = picture["data"] as? [String:Any],
            let urlString = pData["url"] as? String,
            let url = URL(string:urlString){
            //load profile picture
            
            profilePicImageView.sd_setImage(with: url)
        }
        */
        //or base on
        //http://stackoverflow.com/questions/11442442/get-user-profile-picture-by-id
        let facebookID = AccessToken.current!.userId!
        let urlString = "https://graph.facebook.com/\(facebookID)/picture?type=large"
        profilePicImageView.sd_setImage(with: URL(string: urlString)!)
        
    }
    
    //MARK: - IBAction
    
    @IBAction func sharePhotoAction(_ sender: Any) {
        
        let image = #imageLiteral(resourceName: "y_u_no")
        let photo = Photo(image: image, userGenerated: false)
    
        var content = PhotoShareContent(photos: [photo])
        content.hashtag = Hashtag("#AVIChAI_MASLAWI")
        try? ShareDialog.show(from: self, content: content)
    }

    @IBAction func shareQueteAction(_ sender: Any) {
        let url = URL(string: "http://xcoder.solutions/")!
        let imageURL = URL(string: "http://images.apple.com/apple-events/static/apple-events/september-2013/video/poster_large_2x.jpg")!
        let content = LinkShareContent(url: url, title: textField.text, description: "Your app, our passion", quote: "Passion - strong and barely controllable emotion.", imageURL: imageURL)
        
        let shareDialog = ShareDialog(content: content)
        shareDialog.mode = .automatic
        
        func completion(result : ContentSharerResult<LinkShareContent>){
            print(result)
        }
        
        shareDialog.completion = completion
        
        try? shareDialog.show()
        
    }
}







