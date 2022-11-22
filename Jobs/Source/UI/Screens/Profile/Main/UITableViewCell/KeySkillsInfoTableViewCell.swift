//
//  ProfileKeySkillsInfoTableViewCell.swift
//  Jobs
//
//  Created by Renat Murtazin on 21.11.2022.
//

import UIKit
import TagListView

final class KeySkillsInfoTableViewCell: UITableViewCell {
    
    // MARK: - UI
    
    private lazy var tagListView: TagListView = {
        let tagListView = TagListView()
        tagListView.textColor = .systemBlue
        tagListView.tagBackgroundColor = .systemBackground
        tagListView.borderColor = .systemBlue
        tagListView.textFont = .systemFont(ofSize: 14, weight: .bold)
        tagListView.borderWidth = Constant.BorderWidth.View.tagList
        tagListView.cornerRadius = Constant.CornerRadius.View.tagList
        tagListView.paddingX = Constant.TagListViewPadding.paddingX.HAdapted
        tagListView.paddingY = Constant.TagListViewPadding.paddingY.VAdapted
        tagListView.marginX = Constant.TagListViewMargin.marginX.HAdapted
        tagListView.marginY = Constant.TagListViewMargin.marginY.VAdapted
        tagListView.alignment = .leading
        tagListView.sizeToFit()
        return tagListView
    }()
    
    // MARK: - Overrided
    
    override func prepareForReuse() {
        tagListView.removeAllTags()
    }
    
    // MARK: - Initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Internal
    
    func configure(profileInfoArray: [ProfileMainInfoType]) {
        profileInfoArray.forEach { profileInfo in
            switch profileInfo {
            case .keySkills(let keySkillInfo):
                tagListView.addTag(keySkillInfo.description)
            default:
                break
            }
        }
    }
}

// MARK: - Private

private extension KeySkillsInfoTableViewCell {
    
    func setupUI() {
        backgroundColor = .systemBackground
        
        contentView.addSubview(tagListView)
        
        tagListView.snp.makeConstraints {
            $0.edges.equalTo(contentView).inset(16.HAdapted)
        }
    }
}
