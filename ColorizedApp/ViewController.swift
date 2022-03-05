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
        showSliderValue()
        showColor()
    }
    
    @IBAction func changeColorView() {
        showSliderValue()
        showColor()
    }
}

extension ViewController {
    private func showSliderValue() {
        let values: [UILabel : UISlider] = [
            redValue : redSlider,
            greenValue : greenSlider,
            blueValue : blueSlider
        ]
        
        for (label, slider) in values {
            label.text = String(format: "%.2f", slider.value)
        }
    }
    
    private func showColor() {
        colorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
}
