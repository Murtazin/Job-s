//
//  IntExtension.swift
//  Jobs
//
//  Created by Renat Murtazin on 23.10.2022.
//

import Foundation

extension Int {
    var VAdapted: CGFloat {
        adapted(dimensionSize: CGFloat(self), to: .height)
    }
    
    var HAdapted: CGFloat {
        adapted(dimensionSize: CGFloat(self), to: .width)
    }
}
