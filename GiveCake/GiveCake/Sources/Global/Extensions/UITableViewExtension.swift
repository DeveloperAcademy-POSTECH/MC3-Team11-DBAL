//
//  UITableViewExtension.swift
//  GiveCake
//
//  Created by 김동락 on 2022/07/16.
//

import UIKit

extension UITableView {
    func ut_registerClassCell<T>(_ cellType: T.Type) where T: UITableViewCell {
        let identifier = "\(cellType)"
        register(cellType, forCellReuseIdentifier: identifier)
    }
    func ut_dequeueReusable<T: UITableViewCell>(_ cell: T.Type, for indexPath: IndexPath) -> T {
        let cell = dequeueReusableCell(withIdentifier: "\(T.self)", for: indexPath) as! T
        return cell
    }
}
