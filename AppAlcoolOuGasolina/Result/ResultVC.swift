//
//  ResultVC.swift
//  AppAlcoolOuGasolina
//
//  Created by Daniel  Alves Barreto on 30/01/23.
//

import UIKit

enum BestFuel: String  {
    case gas = "Gasolina"
    case ethanol = "Álcool"
}

class ResultVC: UIViewController {
    
    var screen: ResultScreen?
    var bestFuel: BestFuel
    
    init(bestFuel: BestFuel) {
        self.bestFuel = bestFuel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        screen?.delegate(delegate: self)
        screen?.resultLabel.text = bestFuel.rawValue
    }
    
    override func loadView() {
        screen = ResultScreen()
        view = screen
    }
    
    func popViewController(){
        navigationController?.popViewController(animated: true)
    }
    
}

extension ResultVC: ResultScreenProtocol {
    func tappedCalcAgainButton() {
        popViewController()
    }
    
    func tappedBackButton() {
        popViewController()
    }
    
    
}
