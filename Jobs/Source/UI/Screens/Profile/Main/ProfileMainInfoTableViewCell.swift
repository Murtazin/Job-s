//
//  ProfileMainInfoTableViewCell.swift
//  Jobs
//
//  Created by Renat Murtazin on 08.11.2022.
//

import UIKit

final class ProfileMainInfoTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "ProfileMainInfoTableViewCell"
    
    // MARK: - Initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Internal
    
    func configure(view: UIView) {
        contentView.addSubview(view)
        
        view.snp.makeConstraints {
            $0.edges.equalTo(contentView)
        }
    }
}
