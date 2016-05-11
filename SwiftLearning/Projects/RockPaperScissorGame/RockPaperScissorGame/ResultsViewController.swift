//
//  ResultsViewController.swift
//  RockPaperScissorGame
//
//  Created by Jamaal Sedayao on 1/27/16.
//  Copyright © 2016 Jamaal Sedayao. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    @IBOutlet var label: UILabel!
    @IBAction func playAgain(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    var resultString: String!
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        label.text = resultString
    }
       
}
 

