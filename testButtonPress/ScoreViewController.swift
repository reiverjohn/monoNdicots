//
//  ScoreViewController.swift
//  testButtonPress
//
//  Created by jevans on 11/5/15.
//  Copyright © 2015 Joseph Evans. All rights reserved.
//

import UIKit

class ScoreViewController: UIViewController {

    @IBOutlet weak var introTextLabel: UILabel!
    @IBOutlet weak var scoreTextLabel: UILabel!
    
    var score = 0  //This data comes from the quiz file
    var numQuestions = 0 //this data comes from the quiz file
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true  //This command hides the back button so they can't keep quizzing
        
        if score > 0 {  //This part gives a custom greeting based on how many questions they got right
            introTextLabel.text = "Congratulations!  Very well done!"
        }
        else {
            introTextLabel.text = "Better luck next time!"
        }
        
        scoreTextLabel.text = "You got \(score) out of \(numQuestions) correct."  //using the slash and parantheses lets you put variables in the string
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
