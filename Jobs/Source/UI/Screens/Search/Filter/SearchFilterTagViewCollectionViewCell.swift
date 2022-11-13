//
//  SearchFilterTagViewCollectionViewCell.swift
//  Jobs
//
//  Created by Renat Murtazin on 29.10.2022.
//

import UIKit

final class SearchFilterTagViewCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "SearchFilterTagViewCollectionViewCell"
    
    // MARK: - UI
    
    private var tagView: TagView?
    
    // MARK: - Internal
    
    func configure(title: String) {
        tagView = TagView(title: title)
        
        setupUI()
    }
}

// MARK: - Private

private extension SearchFilterTagViewCollectionViewCell {
    
    func setupUI() {
        backgroundColor = .systemBackground
        
        guard let tagView = tagView else {
            return
        }
        
        contentView.addSubview(tagView)
        
        tagView.snp.makeConstraints {
            $0.edges.equalTo(contentView)
        }
    }
}
