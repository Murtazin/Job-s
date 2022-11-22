//
//  SearchFilterTagListTableViewCell.swift
//  Jobs
//
//  Created by Renat Murtazin on 29.10.2022.
//

import UIKit

final class SearchFilterTagListTableViewCell: UITableViewCell {
    
    // MARK: - Private properties
    
    private var options: [String]?
    
    // MARK: - UI
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let itemSize: CGSize = Constant.CollectionViewItemSize.searchFilters
        layout.itemSize = itemSize
        layout.estimatedItemSize = itemSize
        layout.sectionInset = .init(top: 0, left: 16.HAdapted, bottom: 0, right: 16.HAdapted)
        layout.minimumInteritemSpacing = 16.HAdapted
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    // MARK: - Initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Internal
    
    func configure(options: [String]) {
        self.options = options
    }
}

// MARK: - Private

private extension SearchFilterTagListTableViewCell {
    
    func setupUI() {
        contentView.addSubview(collectionView)
        
        collectionView.dataSource = self
        
        collectionView.register(SearchFilterTagViewCollectionViewCell.self,
                                forCellWithReuseIdentifier: SearchFilterTagViewCollectionViewCell.reuseIdentifier)
        
        collectionView.snp.makeConstraints {
            $0.edges.equalTo(contentView)
        }
    }
}

// MARK: - UICollectionViewDataSource

extension SearchFilterTagListTableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let options = options else {
            return 0
        }
        return options.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchFilterTagViewCollectionViewCell.reuseIdentifier,
                                                            for: indexPath) as? SearchFilterTagViewCollectionViewCell,
              let options = options else {
            return UICollectionViewCell()
        }
        let option = options[indexPath.row]
        cell.configure(title: option)
        return cell
    }
}
