//
//  ViewController.swift
//  HelloWorldApp2
//
//  Created by Кирилл Саталкин on 29.09.2023.
//

import UIKit

protocol SettingViewControllerDelegate: AnyObject {
    func getColor (_ color: UIColor)
}

final class SettingViewController: UIViewController {
   
    @IBOutlet weak var labelSliderRed: UILabel!
    @IBOutlet weak var labelSliderBlue: UILabel!
    @IBOutlet weak var labelSliderGreen: UILabel!
    
    @IBOutlet weak var mainSliderRed: UISlider!
    @IBOutlet weak var mainSliderBlue: UISlider!
    @IBOutlet weak var mainSliderGreen: UISlider!
    
    @IBOutlet weak var mainViewController: UIView!
    
    weak var delegate: SettingViewControllerDelegate!
    
    var colorToDecompose: UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainViewController.layer.cornerRadius = 35
        mainViewController.backgroundColor = colorToDecompose
        
        let ciColor = CIColor(color: colorToDecompose)
        mainSliderRed.value = Float(ciColor.red)
        mainSliderGreen.value = Float(ciColor.green)
        mainSliderBlue.value = Float(ciColor.blue)
        
        labelSliderRed.text = string(from: mainSliderRed)
        labelSliderGreen.text = string(from: mainSliderGreen)
        labelSliderBlue.text = string(from: mainSliderBlue)
      
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    @IBAction func sliderAction(_ sender: UISlider) {
        setupView()
        
        switch sender {
        case mainSliderRed:
            labelSliderRed.text = string(from: mainSliderRed)
        case mainSliderGreen:
            labelSliderGreen.text = string(from: mainSliderGreen)
        default:
            labelSliderBlue.text = string(from: mainSliderBlue)
        }
    }
   
    @IBAction func doneButtonPressed() {
        delegate.getColor(mainViewController.backgroundColor ?? UIColor.clear)
        dismiss(animated: true)
    }
    
    private func setupView() {
        mainViewController.backgroundColor = UIColor(
            red: CGFloat(mainSliderRed.value),
            green: CGFloat(mainSliderGreen.value),
            blue:  CGFloat(mainSliderBlue.value),
            alpha: 1
        )
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
}
