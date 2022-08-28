//
//  UIViewControllerExtension.swift
//  GitFinder
//
//  Created by Waseem Wani on 28/08/22.
//

import UIKit

extension UIViewController {
    func showErrorView(with message: String, completion: ((UIAlertAction) -> Void)?) {
        let alert = UIAlertController(title: "Error!", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Retry", style: UIAlertAction.Style.default, handler: completion))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
}
