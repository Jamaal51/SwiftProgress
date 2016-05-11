//
//  AddEntryViewController.swift
//  ToDoList-Swift
//
//  Created by Jamaal Sedayao on 1/26/16.
//  Copyright © 2016 Jamaal Sedayao. All rights reserved.
//

import UIKit

var myItemList = [String]()

class AddEntryViewController: UIViewController {

    @IBOutlet var textField: UITextField!
    
    @IBAction func addItem(sender: AnyObject){
        //validate text field
        //put on a stack
        //clear text field
        
        if textField.text?.characters.count > 0 {
            
            myItemList.append(textField.text!)
            textField.text = ""
            self.view.endEditing(true)
            print(myItemList)
            
        }
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

/*
// MARK: - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
// Get the new view controller using segue.destinationViewController.
// Pass the selected object to the new view controller.
}
*/
