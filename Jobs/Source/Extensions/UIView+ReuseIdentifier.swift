//
//  UIView+ReuseIdentifier.swift
//  Jobs
//
//  Created by Renat Murtazin on 20.11.2022.
//

import UIKit

protocol ReusableView {
    static var reuseIdentifier: String { get }
}

extension UIView: ReusableView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
