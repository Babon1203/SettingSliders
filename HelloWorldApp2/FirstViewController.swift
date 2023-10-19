//
//  FirstViewController.swift
//  HelloWorldApp2
//
//  Created by Кирилл Саталкин on 18.10.2023.
//

import UIKit

final class FirstViewController: UIViewController {
    
override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingVC = segue.destination as? SettingViewController else { return }
            settingVC.delegate = self
            settingVC.colorToDecompose = view.backgroundColor
        
    }
    
    @IBAction func settingButtonPressed() {
        performSegue(withIdentifier: "show", sender: nil)
    }
}

extension FirstViewController: SettingViewControllerDelegate {
    func getColor(_ color: UIColor) {
        view.backgroundColor = color
    }
}
   

