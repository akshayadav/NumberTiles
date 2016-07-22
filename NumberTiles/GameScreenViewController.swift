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
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(topBar.frame.height)
        print(bottomBar.frame.height)

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
    
    @IBAction func whatheight(sender: UIButton) {
        
        print(topBar.frame.height)
        print(bottomBar.frame.height)
        print(middleGround.frame.height)
        print(UIScreen.mainScreen().bounds.size.height)
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
