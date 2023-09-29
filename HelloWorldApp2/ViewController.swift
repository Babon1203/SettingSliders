//
//  ViewController.swift
//  HelloWorldApp2
//
//  Created by Кирилл Саталкин on 29.09.2023.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var labelSliderRed: UILabel!
    @IBOutlet weak var labelSliderBlue: UILabel!
    @IBOutlet weak var labelSliderGreen: UILabel!
    
    @IBOutlet weak var mainSliderRed: UISlider!
    @IBOutlet weak var mainSliderBlue: UISlider!
    @IBOutlet weak var mainSliderGreen: UISlider!
    
    @IBOutlet weak var mainLabelRed: UILabel!
    @IBOutlet weak var mainLabelGreen: UILabel!
    @IBOutlet weak var mainLabelBlue: UILabel!
    
    @IBOutlet weak var mainViewController: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainViewController.layer.cornerRadius = 30
        setupView()
        setupLabels()
        setupSliders()
    }
    
    @IBAction func mainSliderActionRed() {
        setupView()
        labelSliderRed.text = String(format: "%.2f", mainSliderRed.value)
    }
    @IBAction func mainSliderActionBlue() {
        setupView()
        labelSliderBlue.text = String(format: "%.2f", mainSliderBlue.value)
    }
    @IBAction func mainSliderActionGreen() {
        setupView()
        labelSliderGreen.text = String(format: "%.2f", mainSliderGreen.value)
    }
    
    private func setupLabels() {
        labelSliderGreen.text = mainSliderGreen.value.formatted()
        labelSliderGreen.text = "0.50"
        labelSliderGreen.textColor = .green
        labelSliderBlue.text = mainSliderBlue.value.formatted()
        labelSliderBlue.text = "1.00"
        labelSliderBlue.textColor = .blue
        labelSliderRed.text = mainSliderRed.value.formatted()
        labelSliderRed.text = "0.00"
        labelSliderRed.textColor = .red
    }
    
    private func setupSliders() {
        mainSliderRed.value = 0.00
        mainSliderRed.minimumValue = 0.00
        mainSliderRed.maximumValue = 1.00
        mainSliderRed.minimumTrackTintColor = .red
        
        mainSliderGreen.value = 0.50
        mainSliderGreen.minimumValue = 0.00
        mainSliderGreen.maximumValue = 1.00
        mainSliderGreen.minimumTrackTintColor = .green
        
        mainSliderBlue.value = 1.00
        mainSliderBlue.minimumValue = 0.00
        mainSliderBlue.maximumValue = 1.00
        mainSliderBlue.minimumTrackTintColor = .blue
    }
    
    private func setupView() {
        mainViewController.backgroundColor = UIColor(red: CGFloat(mainSliderRed.value), green: CGFloat(mainSliderGreen.value), blue:  CGFloat(mainSliderBlue.value), alpha: 1)
    }
    
    
    
}


