//
//  GameScreenViewController.swift
//  NumberTiles
//
//  Created by akshay on 7/22/16.
//  Copyright © 2016 akshay. All rights reserved.
//

import UIKit

class GameScreenViewController: UIViewController {

    @IBOutlet weak var topBar: UIView!
    @IBOutlet weak var bottomBar: UIView!
    @IBOutlet weak var middleGround: UIView!
    
    var maxNumberInGame:Int = 12
    var minNumberInGame: Int = 1
    
    //---------Buttons------------
    
    
    @IBOutlet weak var C1R1: UIButton!
    @IBOutlet weak var C2R1: UIButton!
    @IBOutlet weak var C3R1: UIButton!
    @IBOutlet weak var C1R2: UIButton!
    @IBOutlet weak var C2R2: UIButton!
    @IBOutlet weak var C3R2: UIButton!
    @IBOutlet weak var C1R3: UIButton!
    @IBOutlet weak var C2R3: UIButton!
    @IBOutlet weak var C3R3: UIButton!
    @IBOutlet weak var C1R4: UIButton!
    @IBOutlet weak var C2R4: UIButton!
    @IBOutlet weak var C3R4: UIButton!
    
    var arrayOfButtons: NSArray = NSArray()
    
    //----------------------------
    
    
    @IBAction func buttonPressed(sender: UIButton) {
    
        if(sender.currentTitle!.isEqual(String(minNumberInGame))){
            minNumberInGame = minNumberInGame + 1
            maxNumberInGame = maxNumberInGame + 1
            setNumberOnButtons()
        }
        else{
            print("wrong Number")
        }
        
        //print(sender.currentTitle!)
        
    
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(topBar.frame.height)
        print(bottomBar.frame.height)
        
        arrayOfButtons = [C1R1, C2R1, C3R1, C1R2, C2R2, C3R2, C1R3, C2R3, C3R3, C1R4, C2R4, C3R4]
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        
        print(topBar.frame.height)
        print(bottomBar.frame.height)
        
        super.viewDidAppear(animated)
    }
    
    func whatheight() {
        
        print(topBar.frame.height)
        print(bottomBar.frame.height)
        print(middleGround.frame.height)
        print(UIScreen.mainScreen().bounds.size.height)
    }
    
    func setNumberOnButtons(){
    
        var numbersInGame = [Int](minNumberInGame...maxNumberInGame)
        
        for button in arrayOfButtons {
            let randomIndex = Int(arc4random_uniform(UInt32(numbersInGame.count)))
            button.setTitle(String(numbersInGame[randomIndex]), forState: UIControlState.Normal)
            numbersInGame.removeAtIndex(randomIndex)
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

}
