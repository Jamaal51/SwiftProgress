//
//  GameChoice.swift
//  RockPaperScissorGame
//
//  Created by Jamaal Sedayao on 1/27/16.
//  Copyright © 2016 Jamaal Sedayao. All rights reserved.
//

import Foundation

enum GameChoice{
    
case Rock, Paper, Scissors
    
    init(){
        switch(arc4random_uniform(3)){
        case 0:
            self = Rock
        case 1:
            self = Paper
        default:
            self = Scissors
            
        }
    }
    
    
}