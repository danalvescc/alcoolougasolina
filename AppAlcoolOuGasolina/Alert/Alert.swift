//
//  Alert.swift
//  AppAlcoolOuGasolina
//
//  Created by Daniel  Alves Barreto on 28/01/23.
//

import Foundation
import UIKit

class Alert {
    
    var vc: UIViewController?
    
    init(vc: UIViewController) {
        self.vc = vc
    }
    
    func alert(title: String, message: String){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(okButton)
        vc?.present(alertController, animated: true)
    }
}
