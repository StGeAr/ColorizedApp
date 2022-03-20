//
//  ViewController.swift
//  ColorizedApp
//
//  Created by Герман Ставицкий on 04.03.2022.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redTF: UITextField!
    @IBOutlet var greenTF: UITextField!
    @IBOutlet var blueTF: UITextField!
    
    var delegate: SettingsViewControllerDelegate!
    var viewColor: UIColor!
    let numberToolbar = UIToolbar()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorView.layer.cornerRadius = 10
        getRGB(for: viewColor)
        setNewColor()
        setValue(for: redLabel, greenLabel, blueLabel)
        setupKeyboard(for: redTF, greenTF, blueTF)
    }
    
    @IBAction func rgbSlider(_ sender: UISlider) {
        setNewColor()
        switch sender {
        case redSlider:
            redLabel.text = string(from: redSlider)
            redTF.text = string(from: redSlider)
        case greenSlider:
            greenLabel.text = string(from: greenSlider)
            greenTF.text = string(from: greenSlider)
        default:
            blueLabel.text = string(from: blueSlider)
            blueTF.text = string(from: blueSlider)
        }
    }
    
     @IBAction func doneButtonPressed() {
        delegate.setViewBackgroundColor(with: UIColor(
                                                red: CGFloat(redSlider.value),
                                                green: CGFloat(greenSlider.value),
                                                blue: CGFloat(blueSlider.value),
                                                alpha: 1
                                                )
        )
        dismiss(animated: true)
    }
    
}

extension SettingsViewController {
    
    private func setNewColor() {
        colorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
    
    private func setValue(for labels: UILabel...) {
        labels.forEach { label in
            switch label {
            case redLabel:
                redLabel.text = string(from: redSlider)
                redTF.text = string(from: redSlider)
            case greenLabel:
                greenLabel.text = string(from: greenSlider)
                greenTF.text = string(from: greenSlider)
            default:
                blueLabel.text = string(from: blueSlider)
                blueTF.text = string(from: blueSlider)
            }
        }
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    
    private func getRGB (for color: UIColor){
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0

        color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)

        redSlider.value = Float(red)
        greenSlider.value = Float(green)
        blueSlider.value = Float(blue)
    }
    
    private func setupKeyboard(for textFields: UITextField...) {
        numberToolbar.items = [
            UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: self, action: nil),
            UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: self, action: nil),
            UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.plain, target: self, action: nil)
        ]
        numberToolbar.sizeToFit()
        
        textFields.forEach { textField in
            switch textField {
            case redTF:
                redTF.inputAccessoryView = numberToolbar
            case greenTF:
                greenTF.inputAccessoryView = numberToolbar
            default:
                blueTF.inputAccessoryView = numberToolbar
            }
        }
    }
}
