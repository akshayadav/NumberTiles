//
//  GameScreenViewController.swift
//  NumberTiles
//
//  Created by akshay on 7/22/16.
//  Copyright © 2016 akshay. All rights reserved.
//

import UIKit
import ChameleonFramework

class GameScreenViewController: UIViewController {
    
    @IBOutlet weak var topBar: UIView!
    @IBOutlet weak var bottomBar: UIView!
    @IBOutlet weak var middleGround: UIView!
    
    //var maxNumberInGame:Int = 12
    var minNumberInGame: Int = 1
    
    var BGColorTimer: NSTimer = NSTimer()
    var NumberTimer: NSTimer = NSTimer()
    var TimeClockTimer: NSTimer = NSTimer()
    
    
    var TimeLeftTimer: Int = 16
    
    var pause:Bool = false
    
    @IBOutlet weak var scoreLabel: UILabel!
    
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
    
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var TimerClockLabel: UILabel!
    
    var arrayOfButtons: NSArray = NSArray()
    var arrayOfColors: NSArray = NSArray()
    
    var score:Int = 0
    
    //----------------------------
    
    
    func setTimeLeftTimer(){
        
        if(TimeLeftTimer == 0){
            self.gameOver()
        }
        else{
            TimeLeftTimer = TimeLeftTimer - 1
            TimerClockLabel.text = String(TimeLeftTimer)
        }
        
        
    }
    
    func gameOver(){
        
        BGColorTimer.invalidate()
        NumberTimer.invalidate()
        TimeClockTimer.invalidate()
        
        print("Game Over")
        
    }
    
    @IBAction func buttonPressed(sender: UIButton) {
        
        if(!pause){
            
            if(sender.currentTitle!.isEqual(String(minNumberInGame))){
                minNumberInGame = minNumberInGame + 1
                //          maxNumberInGame = maxNumberInGame + 1
                NumberTimer.invalidate()
                
                BGColorTimer.invalidate()
                setNumberOnButtons()
                TimeLeftTimer = 16
                TimeClockTimer.invalidate()
                self.startTimer()
                score = score + TimeLeftTimer
                setScore()
                
            }
            else{
                print("wrong Number")
                
                sender.layer.borderColor = UIColor.redColor().CGColor
                
            }
        }
        
        //        print(sender.currentTitle!)
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(topBar.frame.height)
        print(bottomBar.frame.height)
        
        arrayOfButtons = [C1R1, C2R1, C3R1, C1R2, C2R2, C3R2, C1R3, C2R3, C3R3, C1R4, C2R4, C3R4]
        
        
        //--------------------------------
        
        
        arrayOfColors = [Color.blueShadeLocal, Color.orangeShadeLocal, Color.greenShadeLocal,Color.yellowShadeLocal, Color.pinkShadeLocal]
        
        
        //--------------------------------
        
        setNumberOnButtons()
        self.startTimer()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //    override func viewWillAppear(animated: Bool) {
    //
    //
    //        for button in arrayOfButtons as! [UIButton]{
    //
    //            button.backgroundColor = UIColor.randomFlatColor().lightenByPercentage(25.0)
    //        }
    //
    //        super.viewWillAppear(animated)
    //    }
    
    override func viewDidAppear(animated: Bool) {
        
        print(topBar.frame.height)
        print(bottomBar.frame.height)
        
        super.viewDidAppear(animated)
    }
    
    
    
    func setNumberOnButtons(){
        
        
        var numbersInGame = [Int](minNumberInGame...minNumberInGame + 12)
        
        for button in arrayOfButtons {
            button.layer.borderColor = UIColor.blackColor().CGColor
            let randomIndex = Int(arc4random_uniform(UInt32(numbersInGame.count)))
            button.setTitle(String(numbersInGame[randomIndex]), forState: UIControlState.Normal)
            numbersInGame.removeAtIndex(randomIndex)
        }
        
    }
    
    func removeNumbersOnButtons(){
        
        for button in arrayOfButtons {
            button.setTitle("???",forState: UIControlState.Normal)
        }
        
    }
    
    func changeButtonColor(){
        
        for button in arrayOfButtons as! [UIButton]{
            let bgColor: UIColor = arrayOfColors[Int(arc4random_uniform(UInt32(arrayOfColors.count)))] as! UIColor
            let titleColor: UIColor = UIColor.init(complementaryFlatColorOf: bgColor, withAlpha: 100.0)
            
            //button.backgroundColor = UIColor.init(randomFlatColorOfShadeStyle: UIShadeStyle.Light , withAlpha: 1.0).lightenByPercentage(80.0)
            button.backgroundColor = bgColor
            button.setTitleColor(titleColor, forState: UIControlState.Normal)
            
        }
        
        
    }
    
    func startTimer(){
        
        BGColorTimer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(GameScreenViewController.changeButtonColor), userInfo: nil, repeats: true)
        
        NumberTimer = NSTimer.scheduledTimerWithTimeInterval(5.0, target: self, selector: #selector(GameScreenViewController.setNumberOnButtons), userInfo: nil, repeats: true)
        
        TimeClockTimer = NSTimer.scheduledTimerWithTimeInterval(1.0,target: self,selector: #selector(GameScreenViewController.setTimeLeftTimer),userInfo: nil, repeats: true)
        
    }
    
    
    @IBAction func pauseButtonAction(sender: UIButton) {
        
        if(pause){
            self.startTimer()
            self.setNumberOnButtons()
            pause = false
            
        }
        else{
            BGColorTimer.invalidate()
            TimeClockTimer.invalidate()
            NumberTimer.invalidate()
            self.removeNumbersOnButtons()
            pause = true
        }
        
        print(pause)
        
    }
    
    func setScore() {
        self.scoreLabel.text = String(score)
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



struct Color {
    static let blueShadeLocal = UIColor(red:0/255, green: 242/255, blue: 255/255, alpha:1.0)
    static let orangeShadeLocal = UIColor(red:255/255, green:172/255, blue:0/255, alpha:1.0)
    static let greenShadeLocal = UIColor(red:0/255, green:227/255, blue:0/255, alpha:1.0)
    static let yellowShadeLocal = UIColor(red:242/255, green:231/255, blue:112/255, alpha:1.0)
    static let pinkShadeLocal = UIColor(red:255/255, green:164/255, blue:255/255, alpha:1.0)
    
}
