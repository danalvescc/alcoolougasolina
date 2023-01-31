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
        navigationController?.pushViewController(ResultVC(), animated: true)
        
//        if validateTextField() {
//            let formatter = NumberFormatter()
//            formatter.numberStyle = .decimal
//            
//            let ethanolPrice = (formatter.number(from: screen?.ethanolPriceTextField.text ?? "0.0") as? Decimal ?? 0.0)
//            let gasPrice = (formatter.number(from: screen?.ethanolPriceTextField.text ?? "0.0") as? Decimal ?? 0.0)
//            
//            if ethanolPrice / gasPrice > 0.7 {
////                navigationController?.pushViewController(CalculatorVC(bestPrice:"gas"), animated: true)
//            } else {
////                navigationController?.pushViewController(CalculatorVC(bestPrice:"ethanol"), animated: true)
//            }
//        }
    }
    
    func tappedBackButon() {
        navigationController?.popViewController(animated: true)
    }
    
    
}
