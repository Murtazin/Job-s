//
//  ProfileMainViewController.swift
//  Jobs
//
//  Created by Renat Murtazin on 22.10.2022.
//

import UIKit

struct ProfileMainTableSectionHeaderModel {
    let infoTitle: String
    let infoImage: UIImage
    let editInfoImage: UIImage
}

final class ProfileMainViewController: UIViewController {
    
    // MARK: - Private properties
    
    private var eventClosure: ((ProfileMainViewController.Event) -> Void)?
    
    private var infoViews: [[UIView]] = [
        [],
        [],
        [WorkExperienceView](),
        [],
        [],
        [],
        []
    ]
    
    // MARK: - UI
    
    private lazy var tableHeaderView = ProfileMainHeaderView()
    
    private lazy var infoTableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.estimatedRowHeight = 120.VAdapted
        tableView.estimatedSectionHeaderHeight = 40.VAdapted
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    // MARK: - Initializers
    
    init(eventClosure: ((ProfileMainViewController.Event) -> Void)? = nil) {
        self.eventClosure = eventClosure
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    // MARK: - Internal
    
    func updateInfoViews(view: UIView) {
        switch view {
        case is WorkExperienceView:
            infoViews[2].append(view)
            DispatchQueue.main.async {
                self.infoTableView.reloadData()
            }
        default:
            break
        }
    }
}

// MARK: - Private

private extension ProfileMainViewController {
    
    func setupUI() {
        view.backgroundColor = .systemBackground
        
        #warning("TODO: Take out in Constant")
        let settingsImage = UIImage(systemName: "gearshape")
        let settingsButton = UIBarButtonItem(image: settingsImage, style: .done, target: self, action: #selector(settingsButtonHandler))
        
        #warning("TODO: Take out in Constant")
        navigationItem.title = "Профиль"
        navigationItem.rightBarButtonItem = settingsButton
        
        view.addSubview(infoTableView)
        
        #warning("TODO: Take out in Constant")
        let tableHeaderViewSize: CGSize = [Int(view.frame.width), 100].HResized
        
        tableHeaderView.frame = CGRect(origin: .init(x: 0.HAdapted, y: 0.VAdapted), size: tableHeaderViewSize)
        
        tableHeaderView.delegate = self
        
        infoTableView.tableHeaderView = tableHeaderView
        
        infoTableView.register(ProfileMainInfoTableViewCell.self,
                               forCellReuseIdentifier: ProfileMainInfoTableViewCell.reuseIdentifier)
        
        infoTableView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.bottom.trailing.equalToSuperview()
        }
    }
    
    func sectionHeaderModel(section: Int) -> ProfileMainTableSectionHeaderModel? {
        
        #warning("TODO: Take out in Constant")
        let configuration = UIImage.SymbolConfiguration(pointSize: 22)
        let editInfoImage = UIImage(systemName: "pencil", withConfiguration: configuration)
        let addInfoImage = UIImage(systemName: "plus", withConfiguration: configuration)
        let model: ProfileMainTableSectionHeaderModel?
        switch section {
        case 0:
            guard let image = UIImage(systemName: "person",
                                      withConfiguration: configuration),
                  let editInfoImage = editInfoImage else { return nil }
            model = .init(infoTitle: "Контактная информация", infoImage: image, editInfoImage: editInfoImage)
        case 1:
            guard let image = UIImage(systemName: "creditcard",
                                      withConfiguration: configuration),
                  let editInfoImage = editInfoImage else { return nil }
            model = .init(infoTitle: "Ожидаемая зарплата", infoImage: image, editInfoImage: editInfoImage)
        case 2:
            guard let image = UIImage(systemName: "clock",
                                      withConfiguration: configuration),
                  let editInfoImage = addInfoImage else { return nil }
            model = .init(infoTitle: "Опыт работы", infoImage: image, editInfoImage: editInfoImage)
        case 3:
            guard let image = UIImage(systemName: "doc.text.fill",
                                      withConfiguration: configuration),
                  let editInfoImage = addInfoImage else { return nil }
            model = .init(infoTitle: "Образование", infoImage: image, editInfoImage: editInfoImage)
        case 4:
            guard let image = UIImage(systemName: "wand.and.rays",
                                      withConfiguration: configuration),
                  let editInfoImage = editInfoImage else { return nil }
            model = .init(infoTitle: "Ключевые навыки", infoImage: image, editInfoImage: editInfoImage)
        case 5:
            guard let image = UIImage(systemName: "ellipsis.bubble",
                                      withConfiguration: configuration),
                  let editInfoImage = addInfoImage else { return nil }
            model = .init(infoTitle: "Владение языками", infoImage: image, editInfoImage: editInfoImage)
        case 6:
            guard let image = UIImage(systemName: "ellipsis",
                                      withConfiguration: configuration),
                  let editInfoImage = addInfoImage else { return nil }
            model = .init(infoTitle: "Дополнительно", infoImage: image, editInfoImage: editInfoImage)
        default:
            return nil
        }
        return model
    }
    
    // MARK: - Objc
    
    @objc func settingsButtonHandler(sender: UIBarButtonItem) {
        
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension ProfileMainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return infoViews.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        #warning("TODO: Take out in Constant")
        return 40.VAdapted
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = ProfileMainTableSectionHeaderView()
        guard let model = sectionHeaderModel(section: section) else { return nil }
        headerView.delegate = self
        headerView.configure(model: model, section: section)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        #warning("TODO: Take out in Constant")
        switch indexPath.section {
        case 2:
            return 120.VAdapted
        default:
            return 0.VAdapted
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return infoViews[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProfileMainInfoTableViewCell.reuseIdentifier,
                                                       for: indexPath) as? ProfileMainInfoTableViewCell else {
            return UITableViewCell()
        }
        let view = infoViews[indexPath.section][indexPath.row]
        cell.configure(view: view)
        return cell
    }
}

// MARK: - IProfileMainHeaderViewDelegate

extension ProfileMainViewController: IProfileMainHeaderViewDelegate {
    func editProfileHandler() {
        guard let eventClosure = eventClosure else { return }
        eventClosure(.editProfile)
    }
}

// MARK: -

extension ProfileMainViewController: IProfileMainTableSectionHeaderViewDelegate {
    func editInfoButtonHandler(tag: Int) {
        switch tag {
        case 2:
            guard let eventClosure = eventClosure else { return }
            eventClosure(.workExperienceCell)
        default:
            break
        }
    }
}

// MARK: - Event

extension ProfileMainViewController {
    enum Event {
        case workExperienceCell
        case editProfile
    }
}
