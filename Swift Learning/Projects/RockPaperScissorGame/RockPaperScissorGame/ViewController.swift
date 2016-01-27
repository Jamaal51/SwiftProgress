//
//  ViewController.swift
//  RockPaperScissorGame
//
//  Created by Jamaal Sedayao on 1/27/16.
//  Copyright © 2016 Jamaal Sedayao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var rock: UIButton!
    @IBOutlet var paper: UIButton!
    @IBOutlet var scissor: UIButton!
    
    var userOption: GameChoice!
    var computerOption: GameChoice!
    
    let winnerBlah = [GameChoice.Rock: "Rock crushes Scissors", GameChoice.Paper:"Paper covers Rock", GameChoice.Scissors: "Scissors cuts Paper"]
    
    let winOrLose = [GameResult.Winner: ". You Win!", GameResult.Loser: ". You Lose :(", GameResult.Tie: "Tie game"]
    
    @IBAction func makeChoice(sender: AnyObject) {
        switch (sender as! UIButton){
        case rock:
            userOption = .Rock
            computerOption = GameChoice()
            displayResult()
        case paper:
            userOption = .Paper
            computerOption = GameChoice()
            displayResult()
        case scissor:
            userOption = .Scissors
            computerOption = GameChoice()
            displayResult()
        default:
            print("handle value")
        }
        
    }
    
    func gameResult(userOption:GameChoice, computerOption:GameChoice) -> GameResult {
        
        switch(userOption, computerOption){
            case(GameChoice.Rock, GameChoice.Scissors),(GameChoice.Paper, GameChoice.Rock),
            (GameChoice.Scissors, GameChoice.Paper):
            return GameResult.Winner
        case(GameChoice.Rock, GameChoice.Paper), (GameChoice.Scissors, GameChoice.Rock), (GameChoice.Paper, GameChoice.Scissors):
            return GameResult.Loser
        default:
            return GameResult.Tie
        }
    }
    
    func gameResultText(gameResult: GameResult) -> String{
        
        switch(gameResult){
        case .Winner:
            return winnerBlah[userOption]! + winOrLose[gameResult]!
        case .Loser:
            return winnerBlah[computerOption]! + winOrLose[gameResult]!
        default:
            return winOrLose[gameResult]!
        }
        
    }
    
    func displayResult(){
        //get result of game
        let myGameResult = gameResult(userOption, computerOption: computerOption)
        let myResultString = gameResultText(myGameResult)
        
        //trigger result view controller
        let myStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let destinationVC = myStoryboard.instantiateViewControllerWithIdentifier("ResultsView") as! ResultsViewController
        
        destinationVC.resultString = myResultString
        
        self.presentViewController(destinationVC, animated: true, completion: nil)
        
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

