//
//  MessagesMainViewController.swift
//  Jobs
//
//  Created by Renat Murtazin on 22.10.2022.
//

import UIKit

struct Chat {
    let companyLogo: UIImage
    let companyTitle: String
    let position: String
    let status: String
    let lastMessageDate: String
}

final class MessagesMainViewController: UIViewController {
    
    // MARK: - Private properties
    
    private let data: [Chat] = [
        Chat(companyLogo: #imageLiteral(resourceName: "logo-icon"), companyTitle: "Job's", position: "iOS dev", status: "Отклик на вакансию", lastMessageDate: "18:44"),
        Chat(companyLogo: #imageLiteral(resourceName: "logo-icon"), companyTitle: "Vk", position: "Android dev", status: "Отказ", lastMessageDate: "пн"),
        Chat(companyLogo: #imageLiteral(resourceName: "logo-icon"), companyTitle: "Tinkoff", position: "Data analyst", status: "Вы приглашены", lastMessageDate: "27.08")
    ]
    
    // MARK: - UI
    
    private lazy var chatsTableView: UITableView = {
        let messagesTableView = UITableView()
        messagesTableView.separatorStyle = .none
        messagesTableView.rowHeight = 100.VAdapted
        messagesTableView.estimatedRowHeight = 100.VAdapted
        messagesTableView.delegate = self
        messagesTableView.dataSource = self
        return messagesTableView
    }()
    
    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
}

// MARK: - Private

private extension MessagesMainViewController {
    
    func setupUI() {
        view.backgroundColor = .systemBackground
        
        navigationItem.title = "Сообщения"
        
        view.addSubview(chatsTableView)
        
        chatsTableView.register(ChatTableViewCell.self, forCellReuseIdentifier: ChatTableViewCell.reuseIdentifier)
        
        chatsTableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension MessagesMainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ChatTableViewCell.reuseIdentifier, for: indexPath) as? ChatTableViewCell else {
            return UITableViewCell()
        }
        let model = data[indexPath.row]
        cell.configure(model: model)
        return cell
    }
}
