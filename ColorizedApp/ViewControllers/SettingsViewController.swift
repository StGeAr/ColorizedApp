//
//  ViewController.swift
//  ColorizedApp
//
//  Created by Герман Ставицкий on 04.03.2022.
//

import UIKit

class SettingsViewController: UIViewController {
    
    //MARK: - IBOutlets
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
    
    //MARK: - Outlets
    var viewColor: UIColor!
    var delegate: SettingsViewControllerDelegate!
    
    //MARK: - Override funcs
    override func viewDidLoad() {
        super.viewDidLoad()
        colorView.layer.cornerRadius = 10
        
        getRGB(for: viewColor)
        setNewColor()
        
        setValue(for: redLabel, greenLabel, blueLabel)
        setupKeyboard(for: redTF, greenTF, blueTF)
        
    }
    
    //MARK: - IBActions
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

//MARK: - ColorView
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
    
}
 
//MARK: - Keybord
extension SettingsViewController: UITextFieldDelegate {
        
    private func setupKeyboard(for textFields: UITextField...) {
        let toolbar = UIToolbar()
        
        toolbar.items = [
            UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: self, action: nil),
            UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.plain, target: self, action: #selector(toolbarDoneButtonAction))
        ]
        toolbar.sizeToFit()
        
        textFields.forEach { textField in
            switch textField {
            case redTF:
                redTF.inputAccessoryView = toolbar
                redTF.keyboardType = .decimalPad
            case greenTF:
                greenTF.inputAccessoryView = toolbar
                greenTF.keyboardType = .decimalPad
            default:
                blueTF.inputAccessoryView = toolbar
                blueTF.keyboardType = .decimalPad
            }
        }
    }
    
    @objc private func toolbarDoneButtonAction() {
        updateValue(from: redTF, greenTF, blueTF)
        setNewColor()
        view.endEditing(true)
    }
        
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        toolbarDoneButtonAction()
        view.endEditing(true)
    }
    
    
    private func updateValue(from texFields: UITextField...) {
        texFields.forEach { textField in
            switch textField {
            case redTF:
                guard let textFieldValue = redTF.text, !textFieldValue.isEmpty else {
                    showAlert(
                        title: "Invalid color value",
                        message: "Please, enter the value not greater than 1.00",
                        textField: redTF
                    )
                    redSlider.value = 1
                    redLabel.text = string(from: redSlider)
                    setNewColor()
                    return
                }
                guard let numberValue = Float(textFieldValue), numberValue <= 1  else {
                    showAlert(
                        title: "Invalid color value",
                        message: "Please, enter the value not greater than 1.00",
                        textField: redTF
                    )
                    redSlider.value = 1
                    redLabel.text = string(from: redSlider)
                    setNewColor()
                    return
                }
                redSlider.value = numberValue
                setValue(for: redLabel)
                
            case greenTF:
                guard let textFieldValue = greenTF.text, !textFieldValue.isEmpty else {
                    showAlert(
                        title: "Invalid color value",
                        message: "Please, enter the value not greater than 1.00",
                        textField: greenTF
                    )
                    greenSlider.value = 1
                    greenLabel.text = string(from: greenSlider)
                    setNewColor()
                    return
                }
                guard let numberValue = Float(textFieldValue), numberValue <= 1 else {
                    showAlert(
                        title: "Invalid color value",
                        message: "Please, enter the value not greater than 1.00",
                        textField: greenTF
                    )
                    greenSlider.value = 1
                    greenLabel.text = string(from: greenSlider)
                    setNewColor()
                    return
                }
                greenSlider.value = numberValue
                setValue(for: greenLabel)
                
            default:
                guard let textFieldValue = blueTF.text, !textFieldValue.isEmpty else {
                    showAlert(
                        title: "Invalid color value",
                        message: "Please, enter the value not greater than 1.00",
                        textField: blueTF
                    )
                    blueSlider.value = 1
                    blueLabel.text = string(from: blueSlider)
                    setNewColor()
                    return
                }
                guard let numberValue = Float(textFieldValue), numberValue <= 1 else {
                    showAlert(
                        title: "Invalid color value",
                        message: "Please, enter the value not greater than 1.00",
                        textField: blueTF
                    )
                    blueSlider.value = 1
                    blueLabel.text = string(from: blueSlider)
                    setNewColor()
                    return
                }
                blueSlider.value = numberValue
                setValue(for: blueLabel)
            }
        }
    }
    
}

// MARK: - Alert Controller
extension SettingsViewController {
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = "1.00"
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
