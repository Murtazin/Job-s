//
//  ProfileMainInfoTableViewCell.swift
//  Jobs
//
//  Created by Renat Murtazin on 08.11.2022.
//

import UIKit

final class ProfileMainInfoTableViewCell: UITableViewCell {
    
    // MARK: - Internal
    
    func configure(view: UIView) {
        contentView.addSubview(view)
        
        view.snp.makeConstraints {
            $0.edges.equalTo(contentView)
        }
    }
}
