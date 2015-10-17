//
//  ViewController.swift
//  Hangman
//
//  Created by Gene Yoo on 10/13/15.
//  Copyright © 2015 cs198-ios. All rights reserved.
//

import UIKit

class HangmanViewController: UIViewController {
    var game : Hangman = Hangman()
    

    @IBOutlet weak var currentString: UILabel!
    @IBOutlet weak var pastGuesses: UILabel!
    @IBOutlet weak var charTextField: UITextField!
    @IBOutlet weak var drawing: UIImageView!

    @IBAction func guess(sender: UIButton){ // guess button
        if (charTextField.text! == "") {
            self.view.endEditing(true)
            return
        }
        let temp = game.guessLetter(charTextField.text!)
        if (temp == false) {
            // extend drawing
        }
        self.view.endEditing(true)
        charTextField.text! = ""
        pastGuesses.text = game.guesses()
//        print(game.guesses())
//        print(game.guessedLetters)
        currentString.text = game.knownString
        
//        self.tabBarController?.selectedIndex = 0
    }
    
    @IBAction func newGame(sender: UIButton) {
        game.start() // get new word
        charTextField.text! = "" // reset character field
        pastGuesses.text = "" // reset past guesses
        currentString.text = game.knownString
        // reset drawing
    }
    override func viewDidAppear(animated: Bool) {
        game.start()
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

