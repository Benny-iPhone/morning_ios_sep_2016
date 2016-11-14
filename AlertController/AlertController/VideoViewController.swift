//
//  VideoViewController.swift
//  AlertController
//
//  Created by Benny Davidovitz on 14/11/2016.
//  Copyright © 2016 xcoder.solutions. All rights reserved.
//

import UIKit
import MobileCoreServices
import AssetsLibrary
import MediaPlayer
import AVKit

class VideoViewController: UIViewController {

    var url : URL?{
        didSet{
            playButton.isEnabled = url != nil
        }
    }
    @IBOutlet weak var playButton: UIButton!
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    @IBAction func captureVideoAction(_ sender: Any) {
        let picker = UIImagePickerController()
        
        picker.sourceType = UIImagePickerController.isSourceTypeAvailable(.camera) ? .camera : .photoLibrary
        picker.mediaTypes = [kUTTypeMovie as String]
        picker.delegate = self
        
        present(picker, animated: true, completion: nil)
        
    }
    
    @IBAction func playAction(_ sender: Any) {
        let controller = AVPlayerViewController()
        controller.player = AVPlayer(url: url!)
        
        present(controller, animated: true, completion: {
            controller.player?.play()
        })
        /*
        guard let controller = MPMoviePlayerViewController(contentURL: url) else{
            return
        }
    
        present(controller, animated: true, completion: nil)
 */
    }

}

extension VideoViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        print(info)
        
        //make sure user selected a video
        guard let mediaType = info[UIImagePickerControllerMediaType] as? String,
            mediaType == kUTTypeMovie as String
        else {
            return
        }
        
        guard let url = info[UIImagePickerControllerMediaURL] as? URL else {
            return
        }
        
        self.url = url
        
        
        thumbnailImageView.image = thumbnailForVideoAtURL(url: url, atTime: 30)
        
        /*
         //use to import data
        ALAssetsLibrary().writeVideoAtPath(toSavedPhotosAlbum: url, completionBlock: ALAssetsLibraryWriteVideoCompletionBlock!)
        */
        picker.dismiss(animated: true, completion: nil)
        
    }
    //http://stackoverflow.com/questions/33953841/how-to-get-thumbnail-image-of-video-picked-from-uipickerviewcontroller-in-swift
    private func thumbnailForVideoAtURL(url: URL, atTime : Double) -> UIImage? {
        
        let asset = AVAsset(url: url)
        let assetImageGenerator = AVAssetImageGenerator(asset: asset)
        
        var time = asset.duration
        time.value = min(time.value, CMTime(seconds: atTime, preferredTimescale: time.timescale).value)
        
        do {
            let imageRef = try assetImageGenerator.copyCGImage(at: time, actualTime: nil)
            return UIImage(cgImage: imageRef)
        } catch {
            print("error")
            return nil
        }
    }
}
































