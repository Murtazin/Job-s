//
//  MessagesMainViewController.swift
//  Jobs
//
//  Created by Renat Murtazin on 22.10.2022.
//

import UIKit

final class MessagesMainViewController: UIViewController {
    
    // MARK: - Private properties
    
    private let chats: [ChatModel] = [
        ChatModel(companyLogo: #imageLiteral(resourceName: "logo-icon"), companyTitle: "Job's", positionTitle: "iOS dev", status: "Отклик на вакансию", lastMessageDate: "18:44"),
        ChatModel(companyLogo: #imageLiteral(resourceName: "logo-icon"), companyTitle: "Vk", positionTitle: "Android dev", status: "Отказ", lastMessageDate: "пн"),
        ChatModel(companyLogo: #imageLiteral(resourceName: "logo-icon"), companyTitle: "Tinkoff", positionTitle: "Data analyst", status: "Вы приглашены", lastMessageDate: "27.08"),
        ChatModel(companyLogo: #imageLiteral(resourceName: "logo-icon"), companyTitle: "Job's", positionTitle: "iOS dev", status: "Отклик на вакансию", lastMessageDate: "18:44"),
        ChatModel(companyLogo: #imageLiteral(resourceName: "logo-icon"), companyTitle: "Vk", positionTitle: "Android dev", status: "Отказ", lastMessageDate: "пн"),
        ChatModel(companyLogo: #imageLiteral(resourceName: "logo-icon"), companyTitle: "Tinkoff", positionTitle: "Data analyst", status: "Вы приглашены", lastMessageDate: "27.08"),
        ChatModel(companyLogo: #imageLiteral(resourceName: "logo-icon"), companyTitle: "Job's", positionTitle: "iOS dev", status: "Отклик на вакансию", lastMessageDate: "18:44"),
        ChatModel(companyLogo: #imageLiteral(resourceName: "logo-icon"), companyTitle: "Vk", positionTitle: "Android dev", status: "Отказ", lastMessageDate: "пн"),
        ChatModel(companyLogo: #imageLiteral(resourceName: "logo-icon"), companyTitle: "Tinkoff", positionTitle: "Data analyst", status: "Вы приглашены", lastMessageDate: "27.08")
    ]
    
    // MARK: - UI
    
    private lazy var chatsTableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.rowHeight = [0, Constant.TableViewRowHeight.messagesMain].VResized.height
        tableView.estimatedRowHeight = [0, Constant.TableViewRowHeight.messagesMain].VResized.height
        tableView.showsVerticalScrollIndicator = false
        return tableView
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
        
        navigationItem.title = Constant.NavigationItemTitle.messages
        
        view.addSubview(chatsTableView)
        
        chatsTableView.delegate = self
        chatsTableView.dataSource = self
        
        chatsTableView.register(ChatTableViewCell.self, forCellReuseIdentifier: ChatTableViewCell.reuseIdentifier)
        
        chatsTableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension MessagesMainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chats.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ChatTableViewCell.reuseIdentifier,
                                                       for: indexPath) as? ChatTableViewCell else {
            return UITableViewCell()
        }
        let chat = chats[indexPath.row]
        cell.configure(chat: chat)
        cell.selectionStyle = .none
        return cell
    }
}
