//
//  ProfileEditWorkExperienceViewController.swift
//  Jobs
//
//  Created by Renat Murtazin on 08.11.2022.
//

import UIKit

struct WorkExperienceModel {
    let companyLogoImage: UIImage
    let positionTitle: String
    let companyTitle: String
    let experienceDuration: String
}

final class ProfileEditWorkExperienceViewController: UIViewController {
    
    // MARK: - Private properties
    
    private var eventClosure: ((ProfileEditWorkExperienceViewController.Event) -> Void)?
    
    // MARK: - UI
    
    private var currentTextField: UITextField?
    
    private let datePicker = UIDatePicker()
    
    private lazy var positionTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Должность"
        label.textColor = .label
        return label
    }()
    
    private lazy var positionTextField = GrayBorderedTextField(tfPlaceholder: "Должность")
    
    private lazy var companyTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Название компании"
        label.textColor = .label
        return label
    }()
    
    private lazy var companyTextField = GrayBorderedTextField(tfPlaceholder: "Компания")
    
    private lazy var startDateLabel: UILabel = {
        let label = UILabel()
        label.text = "Дата начала работы"
        label.textColor = .label
        return label
    }()
    
    private lazy var startDateTextField = GrayBorderedTextField(tfPlaceholder: "Дата начала")
    
    private lazy var endDateLabel: UILabel = {
        let label = UILabel()
        label.text = "Дата окончания работы"
        label.textColor = .label
        return label
    }()
    
    private lazy var endDateTextField = GrayBorderedTextField(tfPlaceholder: "Дата окончания")
    
    private lazy var currentlyWorkingHereLabel: UILabel = {
        let label = UILabel()
        label.text = "По настоящее время"
        label.textColor = .label
        return label
    }()
    
    private lazy var currentlyWorkingHereSwitch: UISwitch = {
        let switchView = UISwitch()
        switchView.onTintColor = .systemBlue
        return switchView
    }()
    
    private lazy var saveButton = BlueRoundedButton(title: "Сохранить")
    
    // MARK: - Initializers
    
    init(eventClosure: ((ProfileEditWorkExperienceViewController.Event) -> Void)? = nil) {
        self.eventClosure = eventClosure
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupDatePicker()
        setupUI()
    }
}

private extension ProfileEditWorkExperienceViewController {
    
    func setupDatePicker() {
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .date
        datePicker.maximumDate = Date()
        
        let toolBarSize: CGSize = [Int(view.frame.width), 30].HResized
    
        let toolbar = UIToolbar(frame: CGRect(origin: .init(x: 0, y: 0), size: toolBarSize))
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Готово", style: .done, target: self, action: #selector(toolbarDoneButtonHandler))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Отмена", style: .plain, target: self, action: #selector(toolbarCancelButtonHandler))
        
        toolbar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        
        startDateTextField.inputAccessoryView = toolbar
        startDateTextField.inputView = datePicker
        
        endDateTextField.inputAccessoryView = toolbar
        endDateTextField.inputView = datePicker
    }
    
    func setupUI() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(positionTitleLabel)
        view.addSubview(positionTextField)
        view.addSubview(companyTitleLabel)
        view.addSubview(companyTextField)
        view.addSubview(startDateLabel)
        view.addSubview(startDateTextField)
        view.addSubview(endDateLabel)
        view.addSubview(endDateTextField)
        view.addSubview(currentlyWorkingHereLabel)
        view.addSubview(currentlyWorkingHereSwitch)
        view.addSubview(saveButton)
        
        positionTitleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(16.VAdapted)
            $0.leading.equalToSuperview().inset(16.HAdapted)
        }
        
        positionTextField.snp.makeConstraints {
            $0.top.equalTo(positionTitleLabel.snp.bottom).offset(8.VAdapted)
            $0.leading.trailing.equalToSuperview().inset(16.HAdapted)
            $0.height.equalTo(Constant.Height.TextField.grayBordered.VAdapted)
        }
        
        companyTitleLabel.snp.makeConstraints {
            $0.top.equalTo(positionTextField.snp.bottom).offset(16.VAdapted)
            $0.leading.equalToSuperview().inset(16.HAdapted)
        }
        
        companyTextField.snp.makeConstraints {
            $0.top.equalTo(companyTitleLabel.snp.bottom).offset(8.VAdapted)
            $0.leading.trailing.equalToSuperview().inset(16.HAdapted)
            $0.height.equalTo(Constant.Height.TextField.grayBordered.VAdapted)
        }
        
        startDateLabel.snp.makeConstraints {
            $0.top.equalTo(companyTextField.snp.bottom).offset(16.VAdapted)
            $0.leading.equalToSuperview().inset(16.HAdapted)
        }
        
        startDateTextField.delegate = self
        
        startDateTextField.textAlignment = .center
        
        startDateTextField.snp.makeConstraints {
            $0.top.equalTo(startDateLabel.snp.bottom).offset(8.VAdapted)
            $0.leading.trailing.equalToSuperview().inset(16.HAdapted)
            $0.height.equalTo(Constant.Height.TextField.grayBordered.VAdapted)
        }
        
        endDateLabel.snp.makeConstraints {
            $0.top.equalTo(startDateTextField.snp.bottom).offset(16.VAdapted)
            $0.leading.equalToSuperview().inset(16.HAdapted)
        }
        
        endDateTextField.delegate = self
        
        endDateTextField.textAlignment = .center
        
        endDateTextField.snp.makeConstraints {
            $0.top.equalTo(endDateLabel.snp.bottom).offset(8.VAdapted)
            $0.leading.trailing.equalToSuperview().inset(16.HAdapted)
            $0.height.equalTo(Constant.Height.TextField.grayBordered.VAdapted)
        }
        
        currentlyWorkingHereLabel.snp.makeConstraints {
            $0.top.equalTo(endDateTextField.snp.bottom).offset(16.VAdapted)
            $0.leading.equalToSuperview().inset(16.HAdapted)
        }
        
        currentlyWorkingHereSwitch.addTarget(self, action: #selector(currentlyWorkingHereSwitchHandler), for: .valueChanged)
        
        currentlyWorkingHereSwitch.snp.makeConstraints {
            $0.centerY.equalTo(currentlyWorkingHereLabel)
            $0.trailing.equalToSuperview().inset(16)
        }
        
        saveButton.addTarget(self, action: #selector(saveButtonHandler), for: .touchUpInside)
        
        saveButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(16.VAdapted)
            $0.size.equalTo([Constant.Width.Button.blueRounded, Constant.Height.Button.blueRounded].HResized)
        }
    }
    
    // MARK: - Objc
    
    @objc func currentlyWorkingHereSwitchHandler(sender: UISwitch) {
        if sender.isOn {
            endDateTextField.backgroundColor = .systemGray6
            endDateTextField.text = nil
            endDateTextField.isUserInteractionEnabled = false
        } else {
            endDateTextField.backgroundColor = .systemBackground
            endDateTextField.isUserInteractionEnabled = true
        }
    }
    
    @objc func toolbarDoneButtonHandler(sender: UIBarButtonItem) {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        
        guard let currentTextField = currentTextField else { return }
        currentTextField.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
    @objc func toolbarCancelButtonHandler(sender: UIBarButtonItem) {
        self.view.endEditing(true)
    }
    
    @objc func saveButtonHandler(sender: UIButton) {
        guard let eventClosure = eventClosure else { return }
        if let positionTitle = positionTextField.text,
           let companyTitle = companyTextField.text,
           let startDate = startDateTextField.text, let endDate = endDateTextField.text {
            guard !positionTitle.isEmpty, !companyTitle.isEmpty, !startDate.isEmpty, !endDate.isEmpty else {
                eventClosure(.fillAllFields)
                return
            }
            let workExp = startDate + " " + endDate
            let image = #imageLiteral(resourceName: "logo-icon")
            eventClosure(.save(WorkExperienceModel(companyLogoImage: image,
                                                   positionTitle: positionTitle,
                                                   companyTitle: companyTitle,
                                                   experienceDuration: workExp)))
        }
    }
}

// MARK: - UITextFieldDelegate

extension ProfileEditWorkExperienceViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        currentTextField = textField
    }
}

// MARK: - Event

extension ProfileEditWorkExperienceViewController {
    enum Event {
        case save(WorkExperienceModel)
        case fillAllFields
    }
}
