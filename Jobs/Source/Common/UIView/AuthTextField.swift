//
//  AuthTextField.swift
//  Jobs
//
//  Created by Renat Murtazin on 21.10.2022.
//

import UIKit

final class AuthTextField: UITextField {
    
    // MARK: - Private properties
    
    private let leftViewImage: UIImage?
    private let rightViewImage: UIImage?
    
    private let tfPlaceholder: String?
    
    private var rightViewImageView: UIImageView?
    
    // MARK: - Initializers
    
    init(leftViewImage: UIImage? = nil, rightViewImage: UIImage? = nil, tfPlaceholder: String? = nil) {
        self.leftViewImage = leftViewImage
        self.rightViewImage = rightViewImage
        
        self.tfPlaceholder = tfPlaceholder
        
        super.init(frame: .zero)
        
        setupTF()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension AuthTextField {
    
    func setupTF() {
        
        placeholder = tfPlaceholder
        
        layer.cornerRadius = 10
        layer.borderWidth = 1.0
        
        borderStyle = .roundedRect
        
        textColor = .label
        tintColor = .systemGray3
        
        layer.borderColor = UIColor.systemGray5.cgColor
        
        clipsToBounds = true
        
        setupLeftView()
        setupRightView()
    }
    
    func setupLeftView() {
        if let leftImage = leftViewImage {
            
            let leftViewImageView = UIImageView(frame: CGRect(x: 15, y: 0, width: 20, height: 15))
            leftViewImageView.image = leftImage
            leftViewImageView.contentMode = .scaleAspectFill
            
            let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 35, height: 15))
            leftView.addSubview(leftViewImageView)
            
            self.leftView = leftView
            leftViewMode = .always
        }
    }
    
    func setupRightView() {
        if let rightImage = rightViewImage {
            
            rightViewImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 23, height: 17))
            
            guard let rightViewImageView = rightViewImageView else {
                return
            }
            rightViewImageView.image = rightImage
            
            let rightViewButton = UIButton(type: .custom)
            rightViewButton.frame = CGRect(x: 0, y: 0, width: 23, height: 17)
            rightViewButton.addTarget(self, action: #selector(rightViewButtonHandler), for: .touchUpInside)
            
            let rightView = UIView(frame: CGRect(x: 0, y: 0, width: 33, height: 17))
            rightView.addSubview(rightViewImageView)
            rightView.addSubview(rightViewButton)
            
            self.rightView = rightView
            rightViewMode = .always
        }
    }
    
    // MARK: - Objc
    
    @objc func rightViewButtonHandler(sender: UIButton) {
        guard let rightViewImageView = rightViewImageView else {
            return
        }
        isSecureTextEntry.toggle()
        rightViewImageView.image = isSecureTextEntry ? SystemImage.showPasswordImage : SystemImage.hidePasswordImage
    }
}
