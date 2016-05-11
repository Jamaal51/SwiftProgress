//
//  View.swift
//  AutoLayoutProject
//
//  Created by Jamaal Sedayao on 4/6/16.
//  Copyright © 2016 Jamaal Sedayao. All rights reserved.
//

import UIKit

class View: UIView {
    
    var blueView: UIView?
    var redView: UIView?
    
    override init(frame:CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.whiteColor()
        //self.setUpView()
        self.setUpWithVisualFormat()
        
    }
    
    required init (coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setUpView(){
        self.blueView = UIView()
        self.blueView?.backgroundColor = UIColor.blueColor()
        self.blueView?.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(self.blueView!)
        
        let centerXConstraint = NSLayoutConstraint(item: self.blueView!, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.CenterX, multiplier: 1.0, constant: 0)
        let centerYConstraint = NSLayoutConstraint(item: self.blueView!, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.CenterY, multiplier: 1.0, constant: 0)
        
        let widthConstraint = NSLayoutConstraint(item: self.blueView!, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: 200)
        let heightConstraint = NSLayoutConstraint(item: self.blueView!, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: 200)
        
        let topConstraint = NSLayoutConstraint(item: self.blueView!, attribute: NSLayoutAttribute.TopMargin, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.TopMargin, multiplier: 1.0, constant: 0)
        
        self.addConstraints([centerXConstraint,topConstraint,widthConstraint,heightConstraint])
        
        self.redView = UIView()
        self.redView?.backgroundColor = UIColor.redColor()
        self.redView?.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(self.redView!)
        
        let redCenterXConstraint = NSLayoutConstraint(item: self.redView!, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self.blueView!, attribute: NSLayoutAttribute.CenterX, multiplier: 1.0, constant: 0)
        let redCenterYConstraint = NSLayoutConstraint(item: self.redView!, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: self.blueView!, attribute: NSLayoutAttribute.CenterY, multiplier: 1.0, constant: 0)
        
        let widthConstraint2 = NSLayoutConstraint(item: self.redView!, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: 100)
        let heightConstraint2 = NSLayoutConstraint(item: self.redView!, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: 100)
        
        self.addConstraints([redCenterXConstraint, redCenterYConstraint, widthConstraint2, heightConstraint2])
    }
    
    func setUpWithVisualFormat(){
        
        self.blueView = UIView()
        self.blueView?.backgroundColor = UIColor.blueColor()
        self.blueView?.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(self.blueView!)
        
        self.redView = UIView()
        self.redView?.backgroundColor = UIColor.redColor()
        self.redView?.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(self.redView!)
        
        let views = [
            "redView" : self.redView!,
            "blueView" : self.blueView!
        ]
        
        let redViewHorizontalConstraint = NSLayoutConstraint.constraintsWithVisualFormat("H:|[redView]|", options:[],  metrics: nil, views: views)
        let redViewVerticalConstraint = NSLayoutConstraint.constraintsWithVisualFormat("V:|-50-[redView(100)]", options: [], metrics: nil, views: views)
        
        let redBlueConstraint = NSLayoutConstraint.constraintsWithVisualFormat("H:|[redView][blueView]|", options: [], metrics: nil, views: views)
        let blueViewHorizontalConstraint = NSLayoutConstraint.constraintsWithVisualFormat("H:|[blueView]|", options: [], metrics: nil, views: views)
        let blueViewVerticalConstraint = NSLayoutConstraint.constraintsWithVisualFormat("V:|-50-[blueView(100)]", options: [], metrics: nil, views: views)
      
        let equalWidthsConstraint = NSLayoutConstraint(item: self.redView!, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: self.blueView!, attribute: NSLayoutAttribute.Width, multiplier: 1.0, constant: 0)
        
        //"H:|[redView]|" horizontal bar stretches to superview
        
            self.addConstraint(equalWidthsConstraint)
            self.addConstraints(redBlueConstraint)
            self.addConstraints(redViewVerticalConstraint)
            self.addConstraints(blueViewVerticalConstraint)

        
      
        print("Ran")
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    }
}
