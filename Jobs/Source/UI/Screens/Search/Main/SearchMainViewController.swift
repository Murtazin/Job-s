//
//  SearchMainViewController.swift
//  Jobs
//
//  Created by Renat Murtazin on 18.10.2022.
//

import UIKit

final class SearchMainViewController: UIViewController {
    
    // MARK: - Private properties
    
    private let vacancies = [String]()
    
    // MARK: - UI
    
    private lazy var searchController: UISearchController = {
        let searchController = UISearchController()
        searchController.searchBar.placeholder = "Должность, ключевые слова"
        searchController.searchBar.showsBookmarkButton = true
        searchController.searchBar.setImage(SystemImage.searchBarFiltersImage, for: .bookmark, state: .normal)
        searchController.searchBar.delegate = self
        searchController.searchResultsUpdater = self
        return searchController
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        tableView.rowHeight = 240
        tableView.estimatedRowHeight = 240
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
}

// MARK: - Private

private extension SearchMainViewController {
    
    func setupUI() {
        
        view.backgroundColor = .systemBackground
        
        view.addSubview(tableView)
        
        navigationItem.searchController = searchController
        
        navigationItem.title = "Вакансии для вас"
        
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        tableView.register(VacancyTableViewCell.self, forCellReuseIdentifier: VacancyTableViewCell.reuseIdentifier)
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension SearchMainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: VacancyTableViewCell.reuseIdentifier,
                                                       for: indexPath) as? VacancyTableViewCell else {
            return UITableViewCell()
        }
        return cell
    }
}

// MARK: - UISearchBarDelegate, UISearchResultsUpdating

extension SearchMainViewController: UISearchBarDelegate, UISearchResultsUpdating {
    func searchBarBookmarkButtonClicked(_ searchBar: UISearchBar) {
        print("Filter")
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        searchController.searchBar.showsBookmarkButton = searchController.isActive ? false : true
    }
}
