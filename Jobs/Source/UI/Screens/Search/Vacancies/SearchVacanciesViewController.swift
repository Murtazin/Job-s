//
//  SearchMainViewController.swift
//  Jobs
//
//  Created by Renat Murtazin on 18.10.2022.
//

import UIKit

final class SearchVacanciesViewController: UIViewController {
    
    // MARK: - Private properties
    
    private let vacancies = [String]()
    
    private var eventClosure: ((SearchVacanciesViewController.Event) -> Void)?
    
    // MARK: - UI
    
    private lazy var searchController: UISearchController = {
        let searchController = UISearchController()
        searchController.searchBar.placeholder = Constant.SearchBarPlaceholder.position
        searchController.searchBar.showsBookmarkButton = true
        
        let configuration = Constant.SymbolConfiguration.pointSize22
        let name = Constant.SystemImageName.filterBookmark
        let image = UIImage(systemName: name, withConfiguration: configuration)
        
        searchController.searchBar.setImage(image, for: .bookmark, state: .normal)
        return searchController
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = [0, Constant.TableViewRowHeight.searchVacancies].VResized.height
        tableView.estimatedRowHeight = [0, Constant.TableViewRowHeight.searchVacancies].VResized.height
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    
    // MARK: - Initializers
    
    init(eventClosure: ((SearchVacanciesViewController.Event) -> Void)? = nil) {
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

private extension SearchVacanciesViewController {
    
    func setupUI() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(tableView)
        
        searchController.searchBar.delegate = self
        searchController.searchResultsUpdater = self
        
        navigationItem.searchController = searchController
        
        navigationItem.title = Constant.NavigationItemTitle.vacanciesForYou
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(VacancyTableViewCell.self, forCellReuseIdentifier: VacancyTableViewCell.reuseIdentifier)
        
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension SearchVacanciesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: VacancyTableViewCell.reuseIdentifier,
                                                       for: indexPath) as? VacancyTableViewCell else {
            return UITableViewCell()
        }
        cell.selectionStyle = .none
        return cell
    }
}

// MARK: - UISearchBarDelegate, UISearchResultsUpdating

extension SearchVacanciesViewController: UISearchBarDelegate, UISearchResultsUpdating {
    func searchBarBookmarkButtonClicked(_ searchBar: UISearchBar) {
        eventClosure?(.filter)
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        searchController.searchBar.showsBookmarkButton = searchController.isActive ? false : true
    }
}

// MARK: - Event

extension SearchVacanciesViewController {
    enum Event {
        case filter
    }
}
