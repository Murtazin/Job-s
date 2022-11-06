//
//  SearchFilterTableHeaderView.swift
//  Jobs
//
//  Created by Renat Murtazin on 04.11.2022.
//

import UIKit

protocol ISearchFilterTableHeaderViewDelegate: AnyObject {
    func closeButtonHandler()
}

final class SearchFilterTableHeaderView: UIView {
    
    weak var delegate: ISearchFilterTableHeaderViewDelegate?
    
    // MARK: - UI
    
    private lazy var closeButton: UIButton = {
        let button = UIButton()
        let image = SystemImage.closeBarButtonImage
        button.setImage(image, for: .normal)
        return button
    }()
    
    private lazy var filtersLabel: UILabel = {
        let label = UILabel()
        label.text = "Фильтры"
        label.textColor = .label
        label.font = .systemFont(ofSize: 16, weight: .medium)
        return label
    }()
    
    private lazy var resetButton: UIButton = {
        let button = UIButton()
        button.setTitle("Сбросить", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        return button
    }()
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private

private extension SearchFilterTableHeaderView {
    
    func setupUI() {
        addSubview(closeButton)
        addSubview(filtersLabel)
        addSubview(resetButton)
        
        closeButton.addTarget(self, action: #selector(closeButtonHandler), for: .touchUpInside)
        
        closeButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(16.HAdapted)
        }
        
        filtersLabel.snp.makeConstraints {
            $0.centerY.centerX.equalToSuperview()
        }
        
        resetButton.addTarget(self, action: #selector(resetButtonHandler), for: .touchUpInside)
        
        resetButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(16.HAdapted)
        }
    }
    
    // MARK: - Objc
    
    @objc func closeButtonHandler(sender: UIButton) {
        delegate?.closeButtonHandler()
    }
    
    @objc func resetButtonHandler(sender: UIButton) {
        
    }
}
