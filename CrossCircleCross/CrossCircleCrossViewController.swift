//
//  ViewController.swift
//  CrossCircleCross
//
//  Created by David Sävenmark on 2020-12-26.
//  Copyright © 2020 David Sävenmark. All rights reserved.
//

import UIKit
import MultipeerConnectivity

class CrossCircleCrossViewController: UIViewController {
    
    
    let winningCombinations: Array = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6], [0, 4, 8]]
    
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    var activePlayer = 1 //Cross
    
    var gameIsActive =  true

   
    @IBOutlet weak var label: UILabel!
    
   
    @IBOutlet weak var label_turn: UILabel!
    
    
    @IBAction func action(_ sender: AnyObject)
    
    {
        if(gameState[sender.tag-1] == 0 && gameIsActive == true)
        {
            gameState[sender.tag-1] = activePlayer
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
            
            if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]
            
            {
                gameIsActive = false
                label_turn.isHidden = true
                
                if gameState[combination[0]] == 1
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
            if i == 0
            
            {
                gameIsActive = true
                break
                
            }
            
        }
        
        if gameIsActive == false
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
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: UIControl.State())
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        
        
    
        
    }
  

}
    





