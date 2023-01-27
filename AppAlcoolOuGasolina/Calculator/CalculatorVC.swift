//
//  CalculatorVC.swift
//  AppAlcoolOuGasolina
//
//  Created by Daniel  Alves Barreto on 26/01/23.
//

import UIKit

class CalculatorVC: UIViewController {
    
    var screen: CalculatorScreen?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        screen = CalculatorScreen()
        view = screen
    }
    // MARK: - Navigation

}
