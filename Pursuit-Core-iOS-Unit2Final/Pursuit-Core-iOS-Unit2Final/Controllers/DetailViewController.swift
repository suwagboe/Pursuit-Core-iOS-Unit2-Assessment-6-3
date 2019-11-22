//
//  DetailViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by World Domination a Brand on 11/22/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    
    // MARK: OUTLETS AND VARIABLES

    // selectedColor's name
    @IBOutlet weak var colorNameLabel: UILabel!
    
    // all sliders defaults will be set inside of the properties inspector to limit the amount of code typed.
    
    // variable for the red slider
  
   // use this label to change the color of the fonts based on color of background
    @IBOutlet var sliderOutlets: [UILabel]!
    
    @IBOutlet weak var redSlider: UISlider!
    
    // variables for the blue slider
  //  @IBOutlet weak var blueSliderLabel: UILabel!
    @IBOutlet weak var blueSlider: UISlider!
    
    // variables for the green slider
  //  @IBOutlet weak var greenSliderLabel: UILabel!
    @IBOutlet weak var greenSlider: UISlider!
    
    // variable for the alpha slider that is preset to be equal to 1.0
  //  @IBOutlet weak var alphaStepperLabel: UILabel!
    @IBOutlet weak var alphaStepper: UIStepper!
    
    @IBOutlet weak var restButton: UIButton!
    
    // takes in selected crayon from previous controller
    var selectedColor: Crayon!
    // does not need a didSet it messes up my below guard statement
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadBackgroundColor()
        // need to load the color from seleted color to the view here
       // view.backgroundColor = UIColor(loadBackgroundColor())
    }
    
    func loadBackgroundColor() {
        // unwrapp the imported color from the main ViewController so that way it is no longer an optional
         guard let detailsCrayon = selectedColor else {
            fatalError("couldn't set the selectedColor properly need to redue. ")
        }
        
        redSlider.value = Float(detailsCrayon.red/255)
        blueSlider.value = Float(detailsCrayon.blue/255)
        greenSlider.value = Float(detailsCrayon.green/255)
        alphaStepper.value = (1.0)
        
        view.backgroundColor =  UIColor(displayP3Red: CGFloat(detailsCrayon.red/255), green: CGFloat(detailsCrayon.green/255), blue: CGFloat(detailsCrayon.blue/255), alpha: 1.0)
        
    }
    

    
    //MARK: ACTIONS MAKE IMPACTS
    
    //action for all the sliders below
    
    @IBAction func SliderChangedO(_ sender: UISlider ){
        
       
        
        var redVal = redSlider.value
        var greenVal = greenSlider.value
        var blueVal = blueSlider.value
        if sender.tag == 0 {
                redVal = sender.value
            }
        else if sender.tag == 1{
            blueVal = sender.value
            }
        else if sender.tag == 2{
                greenVal = sender.value;
            }
        view.backgroundColor = UIColor(displayP3Red: CGFloat(redVal), green: CGFloat(greenVal), blue: CGFloat(blueVal), alpha: 1.0)
    
        }
//        var selectedColorAmountOfRed: CGFloat = (CGFloat(selectedColor!.red/255)) {
//               didSet {
//                   print("amount of red is CHANGING")
//               }
//           }
    //    selectedColorAmountOfRed = CGFloat(sender.value)
//        view.backgroundColor = UIColor(displayP3Red: CGFloat(sender.value/255) , green: CGFloat(selectedColor!.green), blue: CGFloat(selectedColor!.blue), alpha: 1.0)
        
        
//        guard let detailsCrayon = selectedColor else {
//            fatalError("couldn't set the selectedColor properly need to redue. ")
//        }
//
//        view.backgroundColor =  UIColor(displayP3Red: CGFloat(sender.value/255), green: CGFloat(detailsCrayon.green/255), blue: CGFloat(detailsCrayon.blue/255), alpha: 1.0)
    
    
    
    
 @IBAction func alphaStepperChangedO(_ sender: UIStepper ){
    }
    
}
