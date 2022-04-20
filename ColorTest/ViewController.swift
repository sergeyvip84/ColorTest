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
    @IBOutlet weak var labelPercentOfWin: UILabel?
    
    var level = true
    var colorR : CGFloat = 0.5
    var colorG : CGFloat = 0.5
    var colorB : CGFloat = 0.5
    
    var randomRed : CGFloat = 0.5
    var randomGreen : CGFloat = 0.5
    var randomBlue : CGFloat = 0.5
    
    lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        randomScreen.layer.cornerRadius = 15
        mainScreen.layer.cornerRadius = 15
        
        doitRandomScreen()
        viewMainScreen()
        
        if level {
            labelPercentOfWin?.text = "Remember and pick this color"
        }
    }
    
    func doitRandomScreen () {
        randomRed = CGFloat.random(in: 0...1)
        randomGreen = CGFloat.random(in: 0...1)
        randomBlue = CGFloat.random(in: 0...1)
        randomScreen.backgroundColor = UIColor(red: randomRed,
                                               green: randomGreen,
                                               blue: randomBlue,
                                               alpha: 1.0)
        
    }
    
    func clearMainScreen () {
        colorR = 0.5
        colorG = 0.5
        colorB = 0.5
        sliderR.value = 0.5
        sliderG.value = 0.5
        sliderB.value = 0.5
    }
    
    func viewMainScreen () {
        mainScreen.backgroundColor = UIColor(red: colorR, green: colorG, blue: colorB, alpha: 1)
        labelRGB.text = "Red:\(Int(colorR * 100)) Green:\(Int(colorG * 100)) Blue:\(Int(colorB * 100))"
    }
    func isHiddenRandomScreen () {
        if level == true && ( colorR == 0.5 || colorG == 0.5 || colorB == 0.5) {
            randomScreen.isHidden = true
        }
    }
    
    @IBAction func buttomTake(_ sender: UIButton) {
        
        let percentOfWin = abs (colorR - randomRed) + abs (colorG - randomGreen) + abs (colorB - randomBlue)
        let percent = Int16(100 - (percentOfWin * 33.33333333333333))
        
        switch percent {
        case 97...100: labelPercentOfWin?.text = "Perfect! Coincidence \(percent)%"
        case 94..<97: labelPercentOfWin?.text = "Good! Coincidence \(percent)%"
        case 90..<94: labelPercentOfWin?.text = "Not bad! Coincidence \(percent)%"
        default: labelPercentOfWin?.text = "Bad Coincidence \(percent)%"
        }
        var today: String {
            Date().description(with: .none)
        }
        
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            let coincidence = Coincidence(context: context)
            coincidence.coincidenceLevel = percent
            coincidence.date = dateFormatter.string(from: Date())
            coincidence.level = level
            
            do {
                try context.save()
                print("Good save data")
            } catch let error as NSError {
                print("Not save data \(error), \(error.userInfo)")
            }
        }
        
        doitRandomScreen()
        clearMainScreen()
        viewMainScreen()
        randomScreen.isHidden = false
        
    }
    
    @IBAction func sliderActionR(_ sender: UISlider) {
        colorR = CGFloat(sender.value)
        viewMainScreen()
        isHiddenRandomScreen()
    }
    
    @IBAction func sliderActionG(_ sender: UISlider) {
        colorG = CGFloat(sender.value)
        viewMainScreen()
        isHiddenRandomScreen()
    }
    @IBAction func sliderActionB(_ sender: UISlider) {
        colorB = CGFloat(sender.value)
        viewMainScreen()
        isHiddenRandomScreen()
    }
}

