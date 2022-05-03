//
//  FirstScreen.swift
//  ColorTest
//
//  Created by Serhii Palamarchuk on 01.12.2021.
//

import UIKit

class FirstScreen: UIViewController {

    @IBOutlet weak var beginnerButton: UIButton!
    @IBOutlet weak var profecionalButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        beginnerButton.layer.cornerRadius = 25
        profecionalButton.layer.cornerRadius = 25
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let vc = segue.destination as? ViewController else { return }
        if segue.identifier == "begginerSegua" {
            vc.level = false
        }
        if segue.identifier == "ProfecionalSegua" {
            vc.level = true
        }
    }
}
