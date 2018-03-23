//
//  ViewController.swift
//  Dicee
//
//  Created by Fernando Bueno on 3/17/18.
//  Copyright © 2018 Fernando Bueno. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var randomDiceIndex1: Int = 0
    var randomDiceIndex2: Int = 0
    
    let diceArray = ["dice1", "dice2", "dice3", "dice4", "dice5", "dice6"]
    let imageDiceArray = [#imageLiteral(resourceName: "dice1"), #imageLiteral(resourceName: "dice2"), #imageLiteral(resourceName: "dice3"), #imageLiteral(resourceName: "dice4"), #imageLiteral(resourceName: "dice5"), #imageLiteral(resourceName: "dice6")]

    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //one way
        updateDiceImages()
        
        //alternative way
        /*[diceImageView1, diceImageView2].forEach { (diceImageView) in
            updateDiceImage(diceImageView)
        }*/
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func rollButtonPressed(_ sender: UIButton) {
        //one way
        updateDiceImages()
        
        //alternative way
        /*[diceImageView1, diceImageView2].forEach { (diceImageView) in
            updateDiceImage(diceImageView)
        }*/
    }
    
    func createRandomNumber() -> Int {
        /* Needed for my way
        //return 1 to 6, to map directly to imageView
        return Int(arc4random_uniform(6))
        */
        
        //Needed for Array way
        return Int(arc4random_uniform(6))
    }
    
    func updateDiceImage(_ dice: UIImageView) {
        let randomDiceIndex = createRandomNumber()
        dice.image = imageDiceArray[randomDiceIndex]
    }
    
    func updateDiceImages(){
        randomDiceIndex1 = createRandomNumber()
        randomDiceIndex2 = createRandomNumber()
        
        /* MY WAY
         diceImageView1.image = UIImage(named: "dice\(randomDiceIndex1)")
         diceImageView2.image = UIImage(named: "dice\(randomDiceIndex2)")*/
        
        /* ARRAY WAY */
        //with strings
        //diceImageView1.image = UIImage(named: diceArray[randomDiceIndex1])
        //diceImageView2.image = UIImage(named: diceArray[randomDiceIndex2])
        
        //with UIImages
        diceImageView1.image = imageDiceArray[randomDiceIndex1]
        diceImageView2.image = imageDiceArray[randomDiceIndex2]
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        updateDiceImages()
    }
}

