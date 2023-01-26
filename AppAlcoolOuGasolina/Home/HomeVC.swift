//
//  HomeVC.swift
//  AppAlcoolOuGasolina
//
//  Created by Daniel  Alves Barreto on 25/01/23.
//

import UIKit

class HomeVC: UIViewController {

    var screen: HomeScreen?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func loadView() {
        screen = HomeScreen()
        view = screen
        screen?.delegate(delegate: self)
    }

}

extension HomeVC: HomeScreenDelegate {
    func tappedStartButton() {
    }
}

