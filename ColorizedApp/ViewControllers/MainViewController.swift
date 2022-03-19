//
//  MainViewController.swift
//  ColorizedApp
//
//  Created by Герман Ставицкий on 19.03.2022.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func setViewBackgroundColor(with color: UIColor)
}

class MainViewController: UIViewController {
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else { return }
        settingsVC.viewColor = view.backgroundColor
        settingsVC.delegate = self
    }
}

    // MARK: - SettingsViewControllerDelegate
extension MainViewController: SettingsViewControllerDelegate {
    func setViewBackgroundColor(with color: UIColor) {
        view.backgroundColor = color
    }
}
