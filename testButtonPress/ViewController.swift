//
//  ViewController.swift
//  testButtonPress
//
//  Created by jevans on 11/4/15.
//  Copyright © 2015 Joseph Evans. All rights reserved.
//  Add an intro slide for differences between monocots and dicots, and then put an entry into the timeline itself, reverse timeline order if possible
import UIKit
import GameplayKit

class ViewController: UIViewController {

    @IBOutlet weak var hintButton: UIButton!
    @IBOutlet weak var firstHint: UIImageView!
    @IBOutlet weak var secondHint: UIImageView!
    @IBOutlet weak var startImage: UIImageView!
    
    var hints = 0
    var plants = [String]() //the names of the plants
    var cot = [Int]()  //whether the plants are monocots or dicots
    var randomPlant = Int()  //This is the random number that chooses which plant to show
    var numQuestions = 0  //this is how many questions the player is asked
    var score = 0 //this is how many questions the player has answered correctly
    var donePlants = [Int:String]()  //this keeps track of which plants have already been shown
 
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.hidesBackButton = true  //Hide the back button so they can't go back
        plants += ["maize", "coconut", "cucumber", "apple", "banana", "beet", "onion", "peanut", "rice", "soy", "tomato", "watermelon", "wheat"]  //these are the plants I'm using.  Make sure the name of the plant matches the name of the file with the photo.  It is case sensitive
        cot += [1,1,2,2,1,2,1,2,1,2,2,2,1]  //this stores whether the plants are monocot "1" or dicot "2".  It must be in the same order as the plants array.
        startImage.layer.borderWidth = 1  //these lines give the image boxes a nice border and frame so they are
        firstHint.layer.borderWidth = 1  //easier to see
        secondHint.layer.borderWidth = 1
        startImage.layer.borderColor = UIColor.lightGrayColor().CGColor
        firstHint.layer.borderColor = UIColor.lightGrayColor().CGColor
        secondHint.layer.borderColor = UIColor.lightGrayColor().CGColor
        askQuestion()  //once all the preparation is done, call the askQuestion function that does all the heavy lifting
        
    }
    
    func askQuestion(action: UIAlertAction! = nil) {  //this needs the = nil or it will give an error
        
        
        randomPlant = GKRandomSource.sharedRandom().nextIntWithUpperBound(13) //this generates a random number between 0 and 12.  If you need a different value, it will generate a number between 0 and the number in the () -1 so if you have a 15 in there, you will get a number between 0-14
        
        while donePlants[randomPlant] == "DONE" { //this is not efficient, but it makes sure I don't repeat a plant
           randomPlant = GKRandomSource.sharedRandom().nextIntWithUpperBound(13)  //This makes sure I don't repeat a question
        }
        
        donePlants[randomPlant] = "DONE"  //Once a plant is used, mark it as so in the hash
        startImage.image = UIImage(named: plants[randomPlant])  //This makes the center image start up
        firstHint.image = nil //These will look like grey boxes because of the color commands earlier
        secondHint.image = nil
        
        title = plants[randomPlant].uppercaseString  //This puts the name of the plant up at the top of the screen in all caps
    }
    
    func gotoEnding(action: UIAlertAction! = nil) {
        self.performSegueWithIdentifier("segueToScoreViewController", sender: nil)  //This function can be called to start the segue to the score page
    }
    
    
    @IBAction func hintButtonPressed(sender: UIButton) { //these things happen when the hint button is pressed
        
        ++hints  //this keeps track of how many times the hint button has been pressed
        if hints == 1 {  //The first time it's pressed
            var firstHintFile = plants[randomPlant]  //Get the name of the plant
            firstHintFile += "_1" //add the "_1" to the end
            firstHint.image = UIImage(named: firstHintFile)  //and now display the image
        }
        if hints == 2 {  //same as above, only with the second picture!
            var secondHintFile = plants[randomPlant]
            secondHintFile += "_2"
            secondHint.image = UIImage(named: secondHintFile)
        }
        if(hints > 2) {
            let ac = UIAlertController(title: "Hint!", message: "You've used all your hints!", preferredStyle: .Alert)  //This makes a popup window
            ac.addAction(UIAlertAction(title: "Continue", style: .Default, handler: nil))  //this gives the popup a button to make it go away
            presentViewController(ac, animated: true, completion: nil)  //I don't know what this does but you need it.  I think it says to do nothing when you hit the button
        }
        
    }

    @IBAction func cotButtonPressed(sender: UIButton) {  //all of this happens when you press the "monocot" or "dicot" buttons
        ++numQuestions  //This keeps track of how many questions you have asked
        
        if numQuestions == 5 {  //Once you reach the right number, do the stuff here
            
            if sender.tag == cot[randomPlant] {  //The cot array has numbers 1 and 2.  The tags for the monocot and dicot buttons are also 1 or 2.  This checks to see if you chose the right one
                
                let ac = UIAlertController(title: "Result", message: "Congratulations, you are correct!", preferredStyle: .Alert)  //This gives a popup like up above
                ac.addAction(UIAlertAction(title: "Continue", style: .Default, handler: gotoEnding)) //but see here the handler is different, so when they press "ok" it triggers the segue
                presentViewController(ac, animated: true, completion: nil)
            }
            else {
                let ac = UIAlertController(title: "Result", message: "Sorry, that's incorrect.", preferredStyle: .Alert)
                ac.addAction(UIAlertAction(title: "Continue", style: .Default, handler: gotoEnding))
                presentViewController(ac, animated: true, completion: nil)
            }
            hints = 0
        }
        
        if sender.tag == cot[randomPlant] {  //this is the same as the one above, except that it doesn't trigger the segue
            ++score
            let ac = UIAlertController(title: "Result", message: "Congratulations, you are correct!", preferredStyle: .Alert)
            ac.addAction(UIAlertAction(title: "Continue", style: .Default, handler: askQuestion)) //here, instead of triggering the segue, it calls the askQuestion function, which resets all this and chooses a new plant
            presentViewController(ac, animated: true, completion: nil)
            hints = 0
        }
        if sender.tag != cot[randomPlant] {
            let ac = UIAlertController(title: "Result", message: "Sorry, that's incorrect.", preferredStyle: .Alert)
            ac.addAction(UIAlertAction(title: "Continue", style: .Default, handler: askQuestion))
            presentViewController(ac, animated: true, completion: nil)
            hints = 0
        }
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
        if segue.identifier == "segueToScoreViewController" {  //This here tells the Navigation Controller which segue to use.
            let scoreViewControllerSegue = segue.destinationViewController as! ScoreViewController
            scoreViewControllerSegue.score = score  //This passes the value of the variable score to the variable score in the next View Controller
            scoreViewControllerSegue.numQuestions = numQuestions   //This does the same for numQuestions
            
            
        }
    }



}

