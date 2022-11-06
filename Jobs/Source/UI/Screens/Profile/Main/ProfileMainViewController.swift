//
//  ProfileMainViewController.swift
//  Jobs
//
//  Created by Renat Murtazin on 22.10.2022.
//

import UIKit

final class ProfileMainViewController: UIViewController {
    
    // MARK: - Private properties
    
    private var eventClosure: ((ProfileMainViewController.Event) -> Void)?
    
    // MARK: - UI
    
    private lazy var tableHeaderView = ProfileMainHeaderView()
    
    private lazy var infoTableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = 50.VAdapted
        tableView.estimatedRowHeight = 50.VAdapted
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
}

// MARK: - Private

private extension ProfileMainViewController {
    
    func setupUI() {
        view.backgroundColor = .systemBackground
        
        let settingsImage = UIImage(systemName: "gearshape")
        let settingsButton = UIBarButtonItem(image: settingsImage, style: .done, target: self, action: #selector(settingsButtonHandler))
        
        navigationItem.title = "Профиль"
        navigationItem.rightBarButtonItem = settingsButton
        
        view.addSubview(infoTableView)
        
        let tableHeaderViewSize: CGSize = [Int(view.frame.width), 100].HResized
        
        tableHeaderView.frame = CGRect(origin: .init(x: 0.HAdapted, y: 0.VAdapted), size: tableHeaderViewSize)
        
        tableHeaderView.delegate = self
        
        infoTableView.register(ProfileMainInfoTableViewCell.self, forCellReuseIdentifier: ProfileMainInfoTableViewCell.reuseIdentifier)
        
        infoTableView.tableHeaderView = tableHeaderView
        
        infoTableView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.bottom.trailing.equalToSuperview()
        }
    }
    
    // MARK: - Objc
    
    @objc func settingsButtonHandler(sender: UIBarButtonItem) {
        
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension ProfileMainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProfileMainInfoTableViewCell.reuseIdentifier,
                                                       for: indexPath) as? ProfileMainInfoTableViewCell else {
            return UITableViewCell()
        }
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

// MARK: - Event

extension ProfileMainViewController {
    enum Event {
        case editProfile
    }
}
