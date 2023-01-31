//
//  CalculatorVC.swift
//  AppAlcoolOuGasolina
//
//  Created by Daniel  Alves Barreto on 26/01/23.
//

import UIKit

class CalculatorVC: UIViewController {
    
    var screen: CalculatorScreen?
    var alert: Alert?

    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        alert = Alert(vc: self)
        screen?.delegate(delegate: self)
    }
    
    override func loadView() {
        screen = CalculatorScreen()
        view = screen
    }
    
    func validateTextField() -> Bool{
        guard let ethanolPrice = screen?.ethanolPriceTextField.text else {
            return false
        }
        guard let gasPrice = screen?.gasPriceTextField.text else {
            return false
        }
        
        if ethanolPrice.isEmpty || gasPrice.isEmpty {
            alert?.alert(title: "Erro", message: "Favor preencher os dados corretamente")
            return false
        }
        
        return true
    }

}

extension CalculatorVC: CalcuulatorScreenDelegate{
    func tappedCalculateButton() {
        if validateTextField() {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            
            let ethanolPrice = (formatter.number(from: screen?.ethanolPriceTextField.text ?? "0.0") as? Double) ?? 0.0
            let gasPrice = (formatter.number(from: screen?.gasPriceTextField.text ?? "0.0") as? Double) ?? 0.0
            
            var vc: ResultVC?
            if ethanolPrice / gasPrice > 0.7 {
                vc = ResultVC(bestFuel: .gas)
                print("gas")
            } else {
                print("Alcool")
                vc = ResultVC(bestFuel: .ethanol)
            }
            navigationController?.pushViewController(vc ?? UIViewController(), animated: true)
        }
    }
    
    func tappedBackButon() {
        navigationController?.popViewController(animated: true)
    }
    
    
}
