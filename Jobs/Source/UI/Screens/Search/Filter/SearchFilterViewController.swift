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
    
    private var sectionHeaderTitles: [String?] = [
        nil,
        nil,
        "Специализация",
        "Город",
        "Требуемый опыт работы",
        "Тип занятости",
        "График работы"
    ]
    
    private var data: [[String]] = [
        ["Сухум", "Гагра", "Гудаута", "Новый Афон", "Ткуарчал", "Очамчыра", "Гал"],
        ["Нет опыта", "", "", ""],
        ["", "", "", "", ""],
        ["Нет опыта", "", "", ""]
    ]
    
    // MARK: - UI
    
    private lazy var filtersTableView: UITableView = {
        let tableView = UITableView()
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        let tableFooterViewSize: CGSize = [Int(view.frame.width), 70].HResized
        tableView.tableFooterView = UIView(frame: CGRect(origin: .init(x: 0.HAdapted, y: 0.VAdapted), size: tableFooterViewSize))
        let tableHeaderViewSize: CGSize = [Int(view.frame.width), 50].HResized
        let headerView = SearchFilterTableHeaderView()
        headerView.delegate = self
        headerView.frame = CGRect(origin: .init(x: 0, y: 0), size: tableHeaderViewSize)
        tableView.tableHeaderView = headerView
        tableView.estimatedSectionHeaderHeight = 0.VAdapted
        tableView.estimatedRowHeight = 70.VAdapted
        tableView.delegate = self
        tableView.dataSource = self
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
        
        filtersTableView.register(SearchFilterTextFieldTableViewCell.self, forCellReuseIdentifier: SearchFilterTextFieldTableViewCell.reuseIdentifier)
        
        filtersTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        filtersTableView.register(SearchFilterTagListTableViewCell.self, forCellReuseIdentifier: SearchFilterTagListTableViewCell.reuseIdentifier)
        
        filtersTableView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(16.VAdapted)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(16.VAdapted)
        }
        
        applyFiltersButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(filtersTableView.snp.bottom).inset(16)
            $0.size.equalTo([Constant.Width.Button.blueRounded, Constant.Height.Button.blueRounded].HResized)
        }
    }
    
    // MARK: - Objc
    
    @objc func closeButtonHandler(sender: UIBarButtonItem) {
        
    }
    
    @objc func resetButtonHandler(sender: UIBarButtonItem) {
        
    }
    
    @objc func addSpecializationButtonHandler(sender: UIButton) {
        
    }
}

// MARK: - UITextFieldDelegate

extension SearchFilterViewController: UITextFieldDelegate {
    
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension SearchFilterViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 7
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
            let placeholder = indexPath.section == 0 ? "Компания" : "Уровень дохода"
            cell.configure(placeholder: placeholder)
            cell.selectionStyle = .none
            return cell
        case 2:
            let buttonSize: CGSize = [0, 20].VResized
            let addSpecializationButton = UIButton(frame: CGRect(origin: .init(x: 16.HAdapted, y: 8.VAdapted), size: buttonSize))
            addSpecializationButton.setTitle("Добавить специализацию", for: .normal)
            addSpecializationButton.setTitleColor(.systemBlue, for: .normal)
            addSpecializationButton.sizeToFit()
            addSpecializationButton.addTarget(self, action: #selector(addSpecializationButtonHandler), for: .touchUpInside)
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.addSubview(addSpecializationButton)
            return cell
        case 3...6:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchFilterTagListTableViewCell.reuseIdentifier,
                                                           for: indexPath) as? SearchFilterTagListTableViewCell else {
                return UITableViewCell()
            }
            let model = data[indexPath.section - 3]
            cell.configure(model: model)
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0, 1:
            return 70.VAdapted
        default:
            return 50.VAdapted
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
        case 2...6:
            let labelSize: CGSize = [0, 20].VResized
            let label = UILabel(frame: CGRect(origin: .init(x: 16.HAdapted, y: -8.VAdapted), size: labelSize))
            label.text = sectionHeaderTitles[section]
            label.font = .systemFont(ofSize: 20, weight: .semibold)
            label.textColor = .label
            label.sizeToFit()
            let headerView = UIView()
            headerView.addSubview(label)
            return headerView
        default:
            return UIView()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 2...6:
            return 25.VAdapted
        default:
            return 0.VAdapted
        }
    }
}

// MARK: - ISearchFilterTableHeaderViewDelegate

extension SearchFilterViewController: ISearchFilterTableHeaderViewDelegate {
    
    func closeButtonHandler() {
        guard let eventClosure = eventClosure else { return }
        eventClosure(.close)
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
