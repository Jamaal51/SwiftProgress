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
    
    var managedContext: NSManagedObjectContext! //propagate a managed context
    var currentBowtie: Bowtie!

  override func viewDidLoad() {
    super.viewDidLoad()
    
    //1 Call insertSampleData(), implemented below. Since viewDidLoad() can be called every time the app is launched, insertSampleData() itself performs a fetch to make sure it isn’t inserting the sample data into Core Data multiple times.
    insertSampleData()
    
    //2 create a fetch request for the purpose of fetching the newly inserted Bowtie entities. The segmented control has tabs to filter by color, so the predicate adds the condition to find the bow ties that match the selected color
    let request = NSFetchRequest(entityName: "Bowtie")
    let firstTitle = segmentedControl.titleForSegmentAtIndex(0)
    
    request.predicate = NSPredicate(format: "searchKey == %@", firstTitle!)
    
    do {
        //3 It executes the fetch request you crafted moments earlier and returns an array of Bowtie objects
        let results = try managedContext.executeFetchRequest(request) as! [Bowtie]
        
        //4 You populate the user interface with the current bow tie in the results array. If there was an error, print the error to the console.
        currentBowtie = results.first
        populate(currentBowtie)
    } catch let error as NSError {
        print("could not fetch \(error), \(error.userInfo)")
    }
    
  }
    func populate(bowtie: Bowtie){
        imageView.image = UIImage(data:bowtie.photoData!)
        nameLabel.text = bowtie.name
        ratingLabel.text = "Rating:\(bowtie.rating!.doubleValue)/5"
        
        timesWornLabel.text = "# times worn: \(bowtie.timesWorn!.integerValue)"
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = .ShortStyle
        dateFormatter.timeStyle = .NoStyle
        
        lastWornLabel.text = "Last Worn: " + dateFormatter.stringFromDate(bowtie.lastWorn!)
        favoriteLabel.hidden = !bowtie.isFavorite!.boolValue
        view.tintColor = bowtie.tintColor as! UIColor
    }
    
    //These methods insert all the bow tie data you had in SampleData.plist into Core Data.

    func insertSampleData(){
        let fetchRequest = NSFetchRequest(entityName: "Bowtie")
        
        fetchRequest.predicate = NSPredicate(format: "searchKey != nil")
        
        let count = managedContext.countForFetchRequest(fetchRequest, error: nil)
        
        //checks for any bow ties
        
        if count > 0 {return}
        
        //and if none are present, it grabs the bow tie information in SampleData.plist,
        
        let path = NSBundle.mainBundle().pathForResource("SampleData", ofType: "plist")
        
        let dataArray = NSArray(contentsOfFile: path!)!
        
        //iterates through each bow tie dictionary
        
        for dict : AnyObject in dataArray{
            
            //and inserts a new Bowtie entity into your Core Data store
            
            let entity = NSEntityDescription.entityForName("Bowtie", inManagedObjectContext: managedContext)
            
            let bowtie = Bowtie(entity: entity!, insertIntoManagedObjectContext: managedContext)
            
            let btDict = dict as! NSDictionary
            
            bowtie.name = btDict["name"] as? String
            bowtie.searchKey = btDict["searchKey"] as? String
            bowtie.rating = btDict["rating"] as? NSNumber
            let tintColorDict = btDict["tintColor"] as? NSDictionary
            bowtie.tintColor = colorFromDict(tintColorDict!)
            
            //Storing images in CORE DATA. The property list contains a file name for each bow tie — the actual images are in the project’s asset catalog. With this file name, you instantiate the UIImage and immediately convert it into NSData by means of UIImagePNGRepresentation() before storing it in the imageData property.
            let imageName = btDict["imageName"] as? String
            let image = UIImage(named: imageName!)
            let photoData = UIImagePNGRepresentation(image!)
            bowtie.photoData = photoData
            
            bowtie.lastWorn = btDict["lastWorn"] as? NSDate
            bowtie.timesWorn = btDict["timesWorn"] as? NSNumber
            bowtie.isFavorite = btDict["isFavorite"] as? NSNumber
        }
    }
    
    // SampleData.plist stores colors in a dictionary that contains three keys: red, green and blue. 
    //This method takes in this dictionary and returns a bona fide UIColor.
    
    func colorFromDict(dict: NSDictionary) -> UIColor {
        let red = dict["red"] as! NSNumber
        let green = dict["green"] as! NSNumber
        let blue = dict["blue"] as! NSNumber
        
        let color = UIColor(red: CGFloat(red)/255.0, green: CGFloat(green)/255.0, blue: CGFloat(blue)/255.0, alpha:1)
        
        return color
    }
    
  
  @IBAction func segmentedControl(control: UISegmentedControl) {
    //The title of each segment in the segmented control conveniently corresponds to a particular tie’s searchKey attribute
    //Grab the title of the currently selected segment and fetch the appropriate bow tie using a well-crafted NSPredicate.
    
    let selectedValue = control.titleForSegmentAtIndex(control.selectedSegmentIndex)
    
    let request = NSFetchRequest(entityName: "Bowtie")
    
    request.predicate = NSPredicate(format:"searchKey == %@", selectedValue!)
    
    //Then, use the last bow tie in the array of results (there should only be one per searchKey) to populate the user interface.
    
    do {
        let results = try managedContext.executeFetchRequest(request) as! [Bowtie]
        currentBowtie = results.first
        populate(currentBowtie)
    } catch let error as NSError {
        print("Could not fetch \(error), \(error.userInfo)")
    }
    
  }

  @IBAction func wear(sender: AnyObject) {
    
    let times = currentBowtie.timesWorn!.integerValue
    currentBowtie.timesWorn = NSNumber(integer: (times + 1))
    
    currentBowtie.lastWorn = NSDate()
    
    do {
        try managedContext.save()
    } catch let error as NSError {
        print("Could not save \(error), \(error.userInfo)")
    }
    
    populate(currentBowtie)
    
  }
  
  @IBAction func rate(sender: AnyObject) {
    
    let alert = UIAlertController(title: "New Rating", message: "Rate this bow tie", preferredStyle: UIAlertControllerStyle.Alert)
    
    let cancelAction = UIAlertAction(title: "Cancel", style: .Default) { (action: UIAlertAction!) -> Void in
    }
    
    let saveAction = UIAlertAction(title: "Save", style: .Default) { (action: UIAlertAction!) -> Void in
        let textField = alert.textFields![0] as UITextField
        self.updateRating(textField.text!)
    }
    alert.addTextFieldWithConfigurationHandler { (textField: UITextField!) -> Void in
        textField.keyboardType = .NumberPad
    }
    
    alert.addAction(cancelAction)
    alert.addAction(saveAction)
    
    presentViewController(alert,
        animated: true,
        completion: nil)
  }

func updateRating(numericString: String){
    currentBowtie.rating = (numericString as NSString).doubleValue
    
    do {
        try managedContext.save()
        populate(currentBowtie)
    } catch let error as NSError {
        print("Could not save \(error), \(error.userInfo)")
        
        if error.domain == NSCocoaErrorDomain && (error.code == NSValidationNumberTooLargeError ||
            error.code == NSValidationNumberTooSmallError) {
            rate(currentBowtie)
        }
    }
}

}

