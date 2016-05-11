//
//  ViewController.swift
//  SwiftProjects
//
//  Created by Jamaal Sedayao on 2/3/16.
//  Copyright © 2016 Jamaal Sedayao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //var urlString: String?

    @IBOutlet var webView: UIWebView!
    
    @IBAction func searchTapped(sender: UIButton) {
        displayURL()
    }
    
    @IBOutlet var textField: UITextField!
    
    func displayURL() {
        let myURLString = String(format:"http://www.%@",textField.text!)
        let myURL = NSURL(string: myURLString)
        let myURLRequest = NSURLRequest(URL: myURL!)
        webView.loadRequest(myURLRequest)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //displayURL()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

