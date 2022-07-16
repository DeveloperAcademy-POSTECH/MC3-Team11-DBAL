//
//  UIViewControllerExtension.swift
//  GiveCake
//
//  Created by 김동락 on 2022/07/16.
//

import UIKit

extension UIViewController {
    @objc func presentUserTableViewController() {
        let navController = UIStoryboard(name: "User", bundle: nil).instantiateViewController(withIdentifier: "UserNavigationControllerID")
        present(navController, animated: true, completion: nil)
    }
}
