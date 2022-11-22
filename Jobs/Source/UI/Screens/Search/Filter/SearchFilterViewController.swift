//
//  SearchFilterViewController.swift
//  Jobs
//
//  Created by Renat Murtazin on 29.10.2022.
//

import UIKit

final class SearchFilterViewController: UIViewController {
    
    // MARK: - Private properties
    
    private var eventClosure: ((SearchFilterViewController.Event) -> Void)?
    
    private var filters: [FilterModel] = [
        FilterModel(sectionFooterTitle: nil, data: ["Компания"]),
        FilterModel(sectionFooterTitle: "Специализация", data: ["Уровень дохода"]),
        FilterModel(sectionFooterTitle: "Город", data: ["Добавить специализацию"]),
        FilterModel(sectionFooterTitle: "Требуемый опыт работы",
                    data: ["Сухум", "Гагра", "Гудаута", "Новый Афон", "Ткуарчал", "Очамчыра", "Гал"]),
        FilterModel(sectionFooterTitle: "Тип занятости",
                    data: ["Нет опыта", "", "", ""]),
        FilterModel(sectionFooterTitle: "График работы",
                    data: ["", "", "", "", ""]),
        FilterModel(sectionFooterTitle: nil,
                    data: ["Нет опыта", "", "", ""])
    ]
    
    // MARK: - UI
    
    private lazy var filtersTableView: UITableView = {
        let tableView = UITableView()
        tableView.estimatedSectionFooterHeight = 0
        tableView.estimatedRowHeight = [0, Constant.TableViewRowHeight.searchFilters].VResized.height
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    
    private lazy var applyFiltersButton = BlueRoundedButton(title: "Применить")
    
    // MARK: - Initializers
    
    init(eventClosure: ((SearchFilterViewController.Event) -> Void)? = nil) {
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

private extension SearchFilterViewController {
    
    func setupUI() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(filtersTableView)
        view.addSubview(applyFiltersButton)
        
        filtersTableView.register(UITableViewCell.self, forCellReuseIdentifier: Constant.ReuseIdentifier.tableViewCell)
        
        filtersTableView.register(SearchFilterTextFieldTableViewCell.self, forCellReuseIdentifier: SearchFilterTextFieldTableViewCell.reuseIdentifier)
        
        filtersTableView.register(SearchFilterTagListTableViewCell.self, forCellReuseIdentifier: SearchFilterTagListTableViewCell.reuseIdentifier)

        let tableHeaderViewSize: CGSize = [Int(view.frame.width), Constant.TableHeaderViewHeight.searchFilters].HResized
        
        let headerView = SearchFilterTableHeaderView()
        headerView.frame = CGRect(origin: .init(x: 0, y: 0), size: tableHeaderViewSize)
        headerView.delegate = self
        
        filtersTableView.tableHeaderView = headerView
        
        filtersTableView.delegate = self
        filtersTableView.dataSource = self
        
        filtersTableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        applyFiltersButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(24)
            $0.size.equalTo([Constant.Width.Button.blueRounded, Constant.Height.Button.blueRounded].HResized)
        }
    }
    
    // MARK: - Objc
    
    @objc func addSpecializationButtonHandler(sender: UIButton) {
        
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension SearchFilterViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return filters.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0, 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchFilterTextFieldTableViewCell.reuseIdentifier,
                                                           for: indexPath) as? SearchFilterTextFieldTableViewCell else {
                return UITableViewCell()
            }
            let placeholder = filters[indexPath.section].data[indexPath.row]
            cell.configure(placeholder: placeholder)
            cell.selectionStyle = .none
            return cell
        case 2:
            let button = UIButton()
            
            button.addTarget(self, action: #selector(addSpecializationButtonHandler), for: .touchUpInside)
            
            let title = filters[indexPath.section].data[indexPath.row]
            
            button.setTitle(title, for: .normal)
            button.setTitleColor(.systemBlue, for: .normal)
            button.titleLabel?.font = .systemFont(ofSize: 18, weight: .light)
            button.sizeToFit()
            
            let cell = tableView.dequeueReusableCell(withIdentifier: Constant.ReuseIdentifier.tableViewCell, for: indexPath)
            cell.addSubview(button)
            
            button.snp.makeConstraints {
                $0.leading.equalTo(cell).inset(16.HAdapted)
                $0.centerY.equalTo(cell)
            }
            return cell
        case 3...6:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchFilterTagListTableViewCell.reuseIdentifier,
                                                           for: indexPath) as? SearchFilterTagListTableViewCell else {
                return UITableViewCell()
            }
            let options = filters[indexPath.section].data
            cell.configure(options: options)
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0, 1:
            let height: Int = Constant.Height.TextField.grayBordered + 12
            return [0, height].VResized.height
        default:
            return [0, Constant.TableViewRowHeight.searchFilters].VResized.height
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        switch section {
        case 1...5:
            return [0, Constant.TableSectionFooterHeight.searchFilters].VResized.height
        default:
            return 0
        }
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        switch section {
        case 1...5:
            let label = UILabel()
            label.text = filters[section].sectionFooterTitle
            label.textColor = .label
            label.font = .systemFont(ofSize: 18, weight: .bold)
            label.sizeToFit()

            let footerView = UIView()
            footerView.addSubview(label)

            label.snp.makeConstraints {
                $0.leading.equalTo(footerView).inset(16.HAdapted)
                $0.centerY.equalTo(footerView)
            }
            return footerView
        default:
            return nil
        }
    }
}

// MARK: - ISearchFilterTableHeaderViewDelegate

extension SearchFilterViewController: ISearchFilterTableHeaderViewDelegate {
    
    func closeButtonHandler() {
        eventClosure?(.close)
    }
}

// MARK: - Event

extension SearchFilterViewController {
    enum Event {
        case close
        case apply
        case reset
    }
}
