//
//  ViewController.swift
//  DrawSomething
//
//  Created by Benny Davidovitz on 27/10/2016.
//  Copyright © 2016 xcoder.solutions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var drawView: DrawView!
    
    @IBAction func clearAction(_ sender: AnyObject) {
        
        drawView.clear()
        
    }
    
    @IBAction func blackAction(_ sender: AnyObject) {
        drawView.color = .black
    }
    
    @IBAction func redAction(_ sender: AnyObject) {
        drawView.color = .red
    }
    
    @IBAction func greenAction(_ sender: AnyObject) {
        drawView.color = .green
    }
    
    @IBAction func sliderAction(_ sender: UISlider) {
        
        drawView.strokeSize = CGFloat(sender.value)
        
    }
    
    
    @IBAction func saveAction(_ sender: AnyObject) {
        //add NSPhotoLibraryUsageDescription to info.plist
        //info.plist its like manifest file
        let image = UIImage(view: drawView)
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
    }
    
    @IBAction func shareAction(_ sender: AnyObject) {
        let image = UIImage(view: drawView)
        let activityVC = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        present(activityVC, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

