//
//  ViewController.swift
//  Jobs
//
//  Created by Renat Murtazin on 17.10.2022.
//

import UIKit

final class ViewController: UIViewController {
    
    var didSendEventClosure: ((ViewController.Event) -> Void)?
    
    private let button: UIButton = {
        let button = UIButton()
        button.setTitle("Press me to log in", for: .normal)
        button.tintColor = .gray
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .link
        
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.heightAnchor.constraint(equalToConstant: 40),
            button.widthAnchor.constraint(equalToConstant: 40)
        ])
        
        button.addTarget(self, action: #selector(tapped), for: .touchUpInside)
    }
    
    @objc func tapped() {
        didSendEventClosure?(.login)
    }
}

extension ViewController {
    enum Event {
        case login
    }
}
