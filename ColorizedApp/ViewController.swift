//
//  ViewController.swift
//  ColorizedApp
//
//  Created by Герман Ставицкий on 04.03.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redValue: UILabel!
    @IBOutlet var greenValue: UILabel!
    @IBOutlet var blueValue: UILabel!
    
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redValue.text = String(format: "%.2f", redSlider.value)
        greenValue.text = String(format: "%.2f", greenSlider.value)
        blueValue.text = String(format: "%.2f", blueSlider.value)

    }

    @IBAction func redSliderAction() {
        let sliderValue = CGFloat(redSlider.value)
        
        colorView.backgroundColor = UIColor.red.withAlphaComponent(sliderValue)
        
        redValue.text = String(format: "%.2f", redSlider.value)
    }
    
    @IBAction func greenSliderAction() {
        let sliderValue = CGFloat(greenSlider.value)
        
        colorView.backgroundColor = UIColor.green.withAlphaComponent(sliderValue)
        
        greenValue.text = String(format: "%.2f", greenSlider.value)
    }
    
    @IBAction func blueSliderAction() {
        let sliderValue = CGFloat(blueSlider.value)
        
        colorView.backgroundColor = UIColor.blue.withAlphaComponent(sliderValue)
        
        blueValue.text = String(format: "%.2f", blueSlider.value)
    }
}





//func sliderAction() {
////    let sliderValue = CGFloat(slider.value)
//    colorView.backgroundColor = UIColor.red.withAlphaComponent(sliderValue)
//    redValue.text = String(format: "%.2f", redSlider.value)
//
//}
