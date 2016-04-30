//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Ivan Weller on 2/17/16.
//  Copyright © 2016 Weller Independent. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var activePlayer = 1 // Noughts = 1 Crosses =2
    
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    var gameActive = true
    
    @IBOutlet var shade: UIImageView!
    
    @IBOutlet var closeButton: UIButton!
    
    @IBAction func closeButtonPressed(sender: AnyObject) {
        
        gameOverLabel.hidden = true
        
        gameOverLabel.center = CGPointMake(gameOverLabel.center.x - 500, gameOverLabel.center.y)
        
        endGamePopup.hidden = true
        
        endGamePopup.center = CGPointMake(endGamePopup.center.x - 500, endGamePopup.center.y)
        
        closeButton.hidden = true
        
        closeButton.center = CGPointMake(closeButton.center.x - 500, closeButton.center.y)
        
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            
            self.shade.alpha = 0
            
        })
        
    }
    
    @IBOutlet var endGamePopup: UIImageView!
    
    @IBOutlet var playAgainButton: UIButton!
    
    @IBAction func playAgain(sender: AnyObject) { // RESETS GAME
        
        activePlayer = 1 // Noughts = 1 Crosses =2
        
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        
        gameActive = true
        
        gameOverLabel.hidden = true
        
        gameOverLabel.center = CGPointMake(gameOverLabel.center.x - 500, gameOverLabel.center.y)
        
        playAgainButton.hidden = true
        
        playAgainButton.center = CGPointMake(playAgainButton.center.x - 500, playAgainButton.center.y)

        endGamePopup.hidden = true
        
        endGamePopup.center = CGPointMake(endGamePopup.center.x - 500, endGamePopup.center.y)
        
        closeButton.hidden = true
        
        closeButton.center = CGPointMake(closeButton.center.x - 500, closeButton.center.y)
        
        UIView.animateWithDuration(0.5, animations: { () -> Void in
        
            self.shade.alpha = 0
            
        })
        
        var buttonToClear : UIButton
        
        for var i = 0; i < 9; i++ {
            
            buttonToClear = view.viewWithTag(i) as! UIButton
            
            buttonToClear.setImage(nil, forState: .Normal)
            
        }
        
    }
    
    @IBOutlet var gameOverLabel: UILabel!
    
    let winningCombinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    
    @IBOutlet var button: UIButton!
    
    // APPLIES TO ALL SQUARES
    @IBAction func buttonPressed(sender: AnyObject) {
        
        if (gameState[sender.tag] == 0 && gameActive == true){
            
            gameState[sender.tag] = activePlayer
        
            if activePlayer == 1 {
                
                sender.setImage(UIImage(named: "noughts"), forState: .Normal)
            
                activePlayer = 2
            
            } else {
            
                sender.setImage(UIImage(named: "crosses"), forState: .Normal)
            
                activePlayer = 1
            
            }
            
            for combination in winningCombinations {
                
                if (gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]) {
                    
                    gameActive = false
                    
                    if gameState[combination[0]] == 1 {
                        
                        gameOverLabel.text = "Noughts has won!"
                        
                    } else {
                        
                        gameOverLabel.text = "Crosses has won!"

                    }
                    
                    endGame()
                }
            }
            
            if gameActive == true {
            
                gameActive = false
            
                for buttonState in gameState {
                
                    if buttonState == 0 {
                    
                        gameActive = true
                
                    }
                
                }
            
                if gameActive == false {
                
                    gameOverLabel.text = "It's a draw!"
                
                
                    endGame()
                }
            
            }
                
        }
    }
    
    
    func endGame() {
        
        gameOverLabel.hidden = false
        
        playAgainButton.hidden = false
        
        endGamePopup.hidden = false
        
        closeButton.hidden = false
        
        shade.hidden = false
        
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            
            self.gameOverLabel.center = CGPointMake(self.gameOverLabel.center.x + 500, self.gameOverLabel.center.y)
            
            self.playAgainButton.center = CGPointMake(self.playAgainButton.center.x + 500, self.playAgainButton.center.y)
            
            self.endGamePopup.center = CGPointMake(self.endGamePopup.center.x + 500, self.endGamePopup.center.y)
            
            self.closeButton.center = CGPointMake(self.closeButton.center.x + 500, self.closeButton.center.y)
            
            self.shade.alpha = 1
            
        })

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        gameOverLabel.hidden = true
        
        gameOverLabel.center = CGPointMake(gameOverLabel.center.x - 500, gameOverLabel.center.y)
        
        playAgainButton.hidden = true
        
        playAgainButton.center = CGPointMake(playAgainButton.center.x - 500, playAgainButton.center.y)
        
        endGamePopup.hidden = true
        
        endGamePopup.center = CGPointMake(endGamePopup.center.x - 500, endGamePopup.center.y)
        
        closeButton.hidden = true
        
        closeButton.center = CGPointMake(closeButton.center.x - 500, closeButton.center.y)
        
        shade.alpha = 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

