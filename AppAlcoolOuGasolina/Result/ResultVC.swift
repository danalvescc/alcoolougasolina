//
//  ResultVC.swift
//  AppAlcoolOuGasolina
//
//  Created by Daniel  Alves Barreto on 30/01/23.
//

import UIKit

class ResultVC: UIViewController {
    
    var screen: ResultScreen?
    
    override func viewDidLoad(){
        super.viewDidLoad()
        screen?.delegate(delegate: self)
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
