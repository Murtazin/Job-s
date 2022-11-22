//
//  ResponsesMainViewController.swift
//  Jobs
//
//  Created by Renat Murtazin on 22.10.2022.
//

import UIKit

final class ResponsesMainViewController: UIViewController {
    
    // MARK: - Private properties
    
    private var responses: [ResponseModel] = [
        ResponseModel(companyLogoImage: Constant.Image.Internal.logo,
                      positionTitle: "iOS dev",
                      companyTitle: "Tinkoff",
                      status: .denied),
        ResponseModel(companyLogoImage: Constant.Image.Internal.logo,
                      positionTitle: "Android dev",
                      companyTitle: "Sber",
                      status: .invited),
        ResponseModel(companyLogoImage: Constant.Image.Internal.logo,
                      positionTitle: "DevOps engineer",
                      companyTitle: "Alfa",
                      status: .notViewed),
        ResponseModel(companyLogoImage: Constant.Image.Internal.logo,
                      positionTitle: "Data analyst manager",
                      companyTitle: "Simbirsoft",
                      status: .viewed)
    ]
    
    // MARK: - UI
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = [0, Constant.TableViewRowHeight.responsesMain].VResized.height
        tableView.estimatedRowHeight = [0, Constant.TableViewRowHeight.responsesMain].VResized.height
        tableView.separatorStyle = .none
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

private extension ResponsesMainViewController {
    
    func setupUI() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(tableView)
        
        navigationItem.title = Constant.NavigationItemTitle.responsesMain
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(ResponseTableViewCell.self, forCellReuseIdentifier: ResponseTableViewCell.reuseIdentifier)
        
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension ResponsesMainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return responses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ResponseTableViewCell.reuseIdentifier,
                                                       for: indexPath) as? ResponseTableViewCell else {
            return UITableViewCell()
        }
        let response = responses[indexPath.row]
        cell.configure(response: response)
        cell.selectionStyle = .none
        return cell
    }
}
