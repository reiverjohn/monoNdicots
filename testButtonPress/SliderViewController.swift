//
//  SliderViewController.swift
//  testButtonPress
//
//  Created by jevans on 11/10/15.
//  Copyright © 2015 Joseph Evans. All rights reserved.
//

import UIKit

class SliderViewController: UIViewController {

    @IBOutlet weak var sliderImageView: UIImageView!
    @IBOutlet weak var sliderTextView: UILabel!
    @IBOutlet weak var sliderYearView: UILabel!
    @IBOutlet weak var myaLabel: UILabel!
    @IBOutlet weak var timeSliderBar: UISlider!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func sliderHasChanged(sender: AnyObject) {  //This triggers every time the slider gets moved
        if(sender is UISlider) { //This is the bit that tells it to look at the new slider value
            myaLabel.text = "million years ago"  //This is blank to start, so this puts the "million years ago" in
            let yearValue = 550 - Int(timeSliderBar.value)   //This gets the value of the slider bar
            sliderYearView.text = String(yearValue) //This changes the visible value of the slider bar number.  note that you have to change the Int number into a String to display.  If you don't do this, you will get an error
            
            
            if yearValue > 500 {  //Each of these changes the text and picture once a value range is reached
                sliderTextView.text = "The first trilobites appeared 520 million years ago."
                sliderImageView.image = UIImage(named: "trilobite")
            }
            if (yearValue > 450) && (yearValue < 500) {  //Each of these changes the text and picture once a value range is reached
                sliderTextView.text = "These are the oldest plants made of more than one cell, and they are called Charophytes."
                sliderImageView.image = UIImage(named: "charophyte")
            }
            if (yearValue > 420) && (yearValue < 450) {  //Note that they use ranges instead of numbers
                sliderTextView.text = "These are liverworts.  They can only live where it is wet, and they use spores instead of seeds."
                sliderImageView.image = UIImage(named: "liverwort")
            }
            if (yearValue > 400) && (yearValue < 420) { //This is because the slider updates a few times a second
                sliderTextView.text = "This is a model of a plant called a Cooksonia.  It was the first plant to have a stem."
                sliderImageView.image = UIImage(named: "cooksonia")
            }
            if (yearValue > 390) && (yearValue < 400) { //so if they slide it too fast, it can miss things.
                sliderTextView.text = "This is a model of a plant called a Baragwanathia.  It was one of the first plants to have leaves."
                sliderImageView.image = UIImage(named: "baragwanathia")
            }
            if (yearValue > 370) && (yearValue < 380) {
                sliderTextView.text = "This is a a plant called a horsetail.  Most are extinct, but some kinds are still alive today."
                sliderImageView.image = UIImage(named: "horsetail")
            }
            if (yearValue > 370) && (yearValue < 380) {
                sliderTextView.text = "Ferns first appeared here, and many types of ferns are still present today."
                sliderImageView.image = UIImage(named: "ferns")
            }
            if (yearValue > 360) && (yearValue < 370) {
                sliderTextView.text = "This is an ancient tree called an Archaeopteris.  It was the first plant to be made of wood. It doesn't have leaves like a tree today, but instead it has leaves like a fern."
                sliderImageView.image = UIImage(named: "archaeopteris")
            }
            if (yearValue > 350) && (yearValue < 360) {
                sliderTextView.text = "This isn't a plant at all, but a fungus, like a mushroom.  It is called Prototaxites, and it could grow up to 25 feet tall."
                sliderImageView.image = UIImage(named: "prototaxites")
            }
            if (yearValue > 340) && (yearValue < 350) {
                sliderTextView.text = "There were so many new kinds of plants in this short time period that they changed the weather and caused an Ice Age."
                sliderImageView.image = UIImage(named: "iceage")
            }
            if (yearValue > 320) && (yearValue < 340) {
                sliderTextView.text = "During this period, there were giant horsetail plants that grew up to 65 feet tall."
                sliderImageView.image = UIImage(named: "horsetail")
            }
            if (yearValue > 290) && (yearValue < 320) {
                sliderTextView.text = "These trees are called Cordaites, and were among the first trees to have seeds."
                sliderImageView.image = UIImage(named: "cordaites")
            }
            if (yearValue > 270) && (yearValue < 290) {
                sliderTextView.text = "These is a gingko tree, which still exist today.  There are even some on this campus!"
                sliderImageView.image = UIImage(named: "gingko")
            }
            if (yearValue > 250) && (yearValue < 270) {
                sliderTextView.text = "This is a cycad, which also still exist today.  They look like palm trees, but they aren't, and can grow to be 1,000 years old."
                sliderImageView.image = UIImage(named: "cycad")
            }
            if (yearValue > 200) && (yearValue < 225) {
                sliderTextView.text = "The earliest dinosaurs, archosaurs, lived 250 million years ago."
                sliderImageView.image = UIImage(named: "batrachotomus")
            }
            if (yearValue > 225) && (yearValue < 250) {
                sliderTextView.text = "The first conifers (tress with cones, like pine cones) appeared here.  They grew in cold, dry places other plants could not."
                sliderImageView.image = UIImage(named: "conifer")
            }
            if (yearValue > 170) && (yearValue < 200) {
                sliderTextView.text = "The first pine trees appeared here, and now they grow all over the world."
                sliderImageView.image = UIImage(named: "pine")
            }
            if (yearValue > 150) && (yearValue < 170) {
                sliderTextView.text = "This is Amborella, one of the very first flowering plants.  That's right, up until now there hasn't been a single flower anywhere on earth. This is also where both monocots and dicots appeared - no one knows if one came before the other."
                sliderImageView.image = UIImage(named: "amborella")
            }
            if (yearValue > 130) && (yearValue < 150) {
                sliderTextView.text = "The apatosauraus got to eat flowering plants!"
                sliderImageView.image = UIImage(named: "apatosaurus")
            }
            if (yearValue > 95) && (yearValue < 130) {
                sliderTextView.text = "These are magnolias, which appeared a long time ago, but are still around today."
                sliderImageView.image = UIImage(named: "magnolia")
            }
            if (yearValue > 75) && (yearValue < 95) {
                sliderTextView.text = "These are figs, which you might have eaten before.  They appeared so long ago that dinosaurs ate figs too!"
                sliderImageView.image = UIImage(named: "fig")
            }
            if (yearValue > 65) && (yearValue < 75) {
                sliderTextView.text = "Triceratops lived now, and you can see it has a powerful beak and teeth to help it eat palm trees and cycads."
                sliderImageView.image = UIImage(named: "triceratops")
            }
            if (yearValue > 0) && (yearValue < 35) {
                sliderTextView.text = "Corn, rice, and sugar cane are all grasses.  Grasses first appeared only 35 million years ago, but they are all over the planet now."
                sliderImageView.image = UIImage(named: "maize")
            }
           
        }
        
    }
    
}


