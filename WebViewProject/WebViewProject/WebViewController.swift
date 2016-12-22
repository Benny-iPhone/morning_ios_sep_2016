//
//  WebViewController.swift
//  WebViewProject
//
//  Created by Benny Davidovitz on 22/12/2016.
//  Copyright © 2016 xcoder.solutions. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController , WKNavigationDelegate{
    @IBOutlet weak var indicator: UIActivityIndicatorView!

    @IBOutlet weak var container: UIView!
    var request : URLRequest?{
        didSet{
            if let request = request{
                _ = webView?.load(request)
            }
        }
    }
    var htmlString : String?{
        didSet{
            if let htmlString = htmlString{
                _ = webView.loadHTMLString(htmlString, baseURL: nil)
            }
        }
    }
    
    
    weak var webView : WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        indicator.startAnimating()
        
        let webView = WKWebView(frame: container.bounds)
        container.addSubview(webView)
        
        if let request = request{
            _ = webView.load(request)
        } else if let htmlString = htmlString{
            _ = webView.loadHTMLString(htmlString, baseURL: nil)
        }
        
        self.webView = webView
        
        webView.navigationDelegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        webView.frame = container.bounds
    }

    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        indicator.startAnimating()
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        indicator.stopAnimating()
        if let url = webView.url{
            print(url)
        }
    }

}
