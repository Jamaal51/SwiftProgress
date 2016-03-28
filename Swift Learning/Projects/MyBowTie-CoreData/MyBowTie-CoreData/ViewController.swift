//
//  ViewController.swift
//  Bow Ties
//
//  Created by Pietro Rea on 6/25/14.
//  Copyright (c) 2014 Razeware. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
  
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var timesWornLabel: UILabel!
    @IBOutlet weak var lastWornLabel: UILabel!
    @IBOutlet weak var favoriteLabel: UILabel!

  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  
  @IBAction func segmentedControl(control: UISegmentedControl) {
    print("works")
  }

  @IBAction func wear(sender: AnyObject) {
    print("works")
  }
  
  @IBAction func rate(sender: AnyObject) {
    print("works")
  }
    
}

