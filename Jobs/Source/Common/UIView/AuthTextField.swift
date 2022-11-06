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
            
            let leftViewImageViewSize: CGSize = [20, 15].HResized
            
            let leftViewImageView = UIImageView(frame: CGRect(origin: .init(x: 15.HAdapted, y: 0.VAdapted), size: leftViewImageViewSize))
            leftViewImageView.image = leftImage
            leftViewImageView.contentMode = .scaleAspectFill
            
            let leftViewSize: CGSize = [35, 15].HResized
            
            let leftView = UIView(frame: CGRect(origin: .init(x: 0.HAdapted, y: 0.VAdapted), size: leftViewSize))
            leftView.addSubview(leftViewImageView)
            
            self.leftView = leftView
            leftViewMode = .always
        }
    }
    
    func setupRightView() {
        if let rightImage = rightViewImage {
            
            let rightViewImageViewSize: CGSize = [23, 17].HResized
            
            rightViewImageView = UIImageView(frame: CGRect(origin: .init(x: 0.HAdapted, y: 0.VAdapted), size: rightViewImageViewSize))
            
            guard let rightViewImageView = rightViewImageView else {
                return
            }
            rightViewImageView.image = rightImage
            
            let rightViewButtonSize: CGSize = [23, 17].HResized
            
            let rightViewButton = UIButton(type: .custom)
            rightViewButton.frame = CGRect(origin: .init(x: 0.HAdapted, y: 0.VAdapted), size: rightViewButtonSize)
            rightViewButton.addTarget(self, action: #selector(rightViewButtonHandler), for: .touchUpInside)
            
            let rightViewSize: CGSize = [33, 17].HResized
            
            let rightView = UIView(frame: CGRect(origin: .init(x: 0.HAdapted, y: 0.VAdapted), size: rightViewSize))
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
