//
//  SearchFilterTagListTableViewCell.swift
//  Jobs
//
//  Created by Renat Murtazin on 29.10.2022.
//

import UIKit

final class SearchFilterTagListTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "SearchFilterTagListTableViewCell"
    
    // MARK: - Private properties
    
    private var modelArray: [String]?
    
    // MARK: - UI
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let itemSize: CGSize = [150, 30].HResized
        layout.itemSize = itemSize
        layout.estimatedItemSize = itemSize
        layout.sectionInset = .init(top: 0.VAdapted, left: 16.HAdapted, bottom: 0.VAdapted, right: 16.HAdapted)
        layout.minimumInteritemSpacing = 10.HAdapted
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
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
    
    func configure(model: [String]) {
        modelArray = model
    }
}

// MARK: - Private

private extension SearchFilterTagListTableViewCell {
    
    func setupUI() {
        contentView.addSubview(collectionView)
        
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
        guard let modelArray = modelArray else {
            return 0
        }
        return modelArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchFilterTagViewCollectionViewCell.reuseIdentifier,
                                                            for: indexPath) as? SearchFilterTagViewCollectionViewCell,
              let modelArray = modelArray else {
            return UICollectionViewCell()
        }
        let model = modelArray[indexPath.row]
        cell.configure(title: model)
        return cell
    }
}
