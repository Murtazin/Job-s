//
//  UITableView+DequeueReusable.swift
//  Jobs
//
//  Created by Renat Murtazin on 20.11.2022.
//

import UIKit

extension UITableView {
    func dequeueReusableCellAtIndexPath<T: UITableViewCell>(indexPath: IndexPath) -> T {
        if let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T {
            return cell
        } else {
            return T()
        }
    }
    
    func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>() -> T {
        if let view = dequeueReusableHeaderFooterView(withIdentifier: T.reuseIdentifier) as? T {
            return view
        } else {
            return T()
        }
    }
}
