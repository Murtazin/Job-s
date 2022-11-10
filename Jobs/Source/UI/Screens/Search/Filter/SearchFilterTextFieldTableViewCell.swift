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
    
    // MARK: - Initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
        
        textField.snp.makeConstraints {
            $0.top.equalTo(contentView).inset(14.VAdapted)
            $0.leading.trailing.equalTo(contentView).inset(16.HAdapted)
            $0.bottom.equalTo(contentView).inset(14.VAdapted)
        }
    }
}
