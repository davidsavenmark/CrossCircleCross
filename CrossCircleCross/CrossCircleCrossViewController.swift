//
//  ViewController.swift
//  CrossCircleCross
//
//  Created by David Sävenmark on 2020-12-26.
//  Copyright © 2020 David Sävenmark. All rights reserved.
//

import UIKit

class CrossCircleCrossViewController: UIViewController {
    
    
    let winningCombinations: Array = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6], [0, 4, 8]] // All possible win combinations
    
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]    // All 0 means that no one has made their move yet,
                                                  // if Cross makes a move it will be a 1 instead of 0
                                                 // if Circle makes a move it will be a 2 instea of 0
    
    var activePlayer = 1 // 1 is Cross and 2 is Circle, Cross always starts.
    var gameIsActive =  true
    
   
    @IBOutlet weak var label: UILabel! // Display who the winner is
    
   
    @IBOutlet weak var label_turn: UILabel! // Displays whos turn it is.
    
    
    @IBAction func action(_ sender: AnyObject) // This action is being called each time our user presses one of the squares.
    
    {
        if(gameState[sender.tag-1] == 0 && gameIsActive == true)
        {
            gameState[sender.tag-1] = activePlayer // checks if gameState has a 1 or a 2 in the list.
            label_turn.text = "Cross turn"
            
            
            if (activePlayer == 1)
                
            {
                
                (sender as AnyObject).setImage(UIImage(named: "piece_cross.png"), for: UIControl.State())
                activePlayer = 2
                label_turn.isHidden = false
                label_turn.text = "Circles turn"
                
                
            }
            else
            {
                
                (sender as AnyObject).setImage(UIImage(named: "piece_circle.png"), for: UIControl.State())
                activePlayer = 1
                label_turn.isHidden = false
                label_turn.text = "Cross turn"
                
                
                
            }
            
        }
        
        for combination in winningCombinations
        {
            
             // Checks if the gameStates values matches the numbers in the different combinations for example: combination [1, 4, 7] = [0, 1, 0, 0, 4, 0, 0, 7, 0]
             // The statement checks first that the activePlayer is not zero then checks whether the second element is equal to the first and then
            // whether the third element is equal to the second. If this condition is true, then either activePlayer 1 or 2 has won. 
            if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]
                
               
                
                
            
            {
                
                gameIsActive = false
                label_turn.isHidden = true
                
                
                if gameState[combination[0]] == 1 // checks who has won
                {
                   
                    label.text = "CROSS WINS!"
                   
                    
                }
                else
                
                {
                    
                   label.text = "CIRCLE WINS!"
                    
                    
                }
                
                playAgainBtn.isHidden = false;
                label.isHidden = false
                label_turn.isHidden = true
                
            }
            
        }
        
        gameIsActive = false
        
        for i in gameState
        {
            if i == 0 // if there are any 0s left in the index, the game is still active
            
            {
                gameIsActive = true
                break // breaks the loop
                
            }
            
        }
        
        if gameIsActive == false  //  Displays if it is a draw when all pieces have been layed but no winning combination has been triggered.
        {
            label.text = "IT IS A DRAW!"
            label.isHidden = false
            playAgainBtn.isHidden = false
            label_turn.isHidden = true
            
        }
        
      
        
    }
    
    
    @IBOutlet weak var playAgainBtn: UIButton!
    @IBAction func playAgain(_ sender: AnyObject)
    
    {
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        gameIsActive = true
        activePlayer = 1
        
        playAgainBtn.isHidden = true
        label.isHidden = true
        label_turn.isHidden = true
        
        for i in 1...9
        {
            let button = view.viewWithTag(i) as! UIButton // Resets the gameboard by converting the view with the tags ( i ) to a UIButton in order to set the image to nil.
            button.setImage(nil, for: UIControl.State())
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        
        
    
        
    }
  

}
    





