//
//  SearchFilterTextFieldTableViewCell.swift
//  Jobs
//
//  Created by Renat Murtazin on 29.10.2022.
//

import UIKit

final class SearchFilterTextFieldTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "SearchFilterTextFieldTableViewCell"
    
    // MARK: - UI
    
    private var textField: GrayBorderedTextField?
    
    // MARK: - Internal
    
    func configure(placeholder: String) {
        textField = GrayBorderedTextField(tfPlaceholder: placeholder)
        
        setupUI()
    }
}

// MARK: - Private

private extension SearchFilterTextFieldTableViewCell {
    
    func setupUI() {
        backgroundColor = .systemBackground
        
        guard let textField = textField else {
            return
        }
        
        contentView.addSubview(textField)
        
        let textFieldWidth: CGFloat = contentView.frame.width - 64
        
        textField.snp.makeConstraints {
            $0.centerY.centerX.equalTo(contentView)
            $0.size.equalTo([Int(textFieldWidth), Constant.Height.TextField.grayBordered].HResized)
        }
    }
}
