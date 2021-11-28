//
//  ViewController.swift
//  ColorTest
//
//  Created by Serhii Palamarchuk on 23.11.2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var sliderR: UISlider!
    @IBOutlet weak var sliderG: UISlider!
    @IBOutlet weak var sliderB: UISlider!
    @IBOutlet weak var labelRGB: UILabel!
    @IBOutlet weak var randomScreen: UIView!
    @IBOutlet weak var mainScreen: UIView!
    @IBOutlet weak var labelPercentOfWin: UILabel!
    
    
    
    var colorR : CGFloat = 0.5
    var colorG : CGFloat = 0.5
    var colorB : CGFloat = 0.5

    let randomRed = CGFloat.random(in: 0...1)
    let randomGreen = CGFloat.random(in: 0...1)
    let randomBlue = CGFloat.random(in: 0...1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        randomScreen.layer.cornerRadius = 15
        mainScreen.layer.cornerRadius = 15
        
        sliderR.value = 0.5
        sliderG.value = 0.5
        sliderB.value = 0.5
          
        randomScreen.backgroundColor = UIColor(red: randomRed,
                                               green: randomGreen,
                                               blue: randomBlue,
                                               alpha: 1.0)
    }
    
    func viewMainScreen () {
        mainScreen.backgroundColor = UIColor(red: colorR, green: colorG, blue: colorB, alpha: 1)
        labelRGB.text = "Red:\(Int(colorR * 100)) Green:\(Int(colorG * 100)) Blue:\(Int(colorB * 100))"
    }
    @IBAction func buttomTake(_ sender: UIButton) {
        var percentOfWin = abs (colorR - randomRed) + abs (colorG - randomGreen) + abs (colorB - randomBlue)
            percentOfWin = 100 - percentOfWin * 33.333333333333
        
        switch percentOfWin {
        case 97...100: labelPercentOfWin.text = "Perfect! Coincidence \(Int(percentOfWin))%"
        case 94..<97: labelPercentOfWin.text = "Good! Coincidence \(Int(percentOfWin))%"
        case 90..<94: labelPercentOfWin.text = "Not bad! Coincidence \(Int(percentOfWin))%"
        default: labelPercentOfWin.text = "Bad Coincidence \(Int(percentOfWin))%"
        }
    }
        
    
    @IBAction func sliderActionR(_ sender: UISlider) {
        colorR = CGFloat(sender.value)
        viewMainScreen()
    }
    
    @IBAction func sliderActionG(_ sender: UISlider) {
        colorG = CGFloat(sender.value)
        viewMainScreen()
    }
    @IBAction func sliderActionB(_ sender: UISlider) {
        colorB = CGFloat(sender.value)
        viewMainScreen()
    }
    
}

