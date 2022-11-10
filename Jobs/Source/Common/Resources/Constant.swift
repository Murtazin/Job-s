//
//  Constant.swift
//  Jobs
//
//  Created by Renat Murtazin on 21.10.2022.
//

import UIKit

struct Constant {
    
    struct StackViewSpacing {
        
        static let externalAuthButtons: Int = 15
        
    }
    
    struct ButtonTitle {
        
        static let proceed = "Продолжить"
        static let forgotPassword = "Забыли пароль?"
        static let login = "Войти"
        static let create = "Создать"
        static let register = "Регистрация"
        
    }
    
    struct LabelText {
        
        static let accessRecovery = "Восстановление доступа"
        static let enterEmailAddress = "Введите адрес электронной почты, привязанный\n к аккаунту"
        static let welcome = "Добро пожаловать"
        static let continueWith = "или продолжить с"
        static let dontHaveAnAccount = "Еще нет аккаунта?"
        static let createAccount = "Создать аккаунт"
        static let accountExist = "Уже есть аккаунт?"
        
    }
    
    struct TextFieldPlaceholder {
        
        static let password = "Пароль"
        static let mail = "Почта"
        
    }
    
    struct CornerRadius {
        
        struct TextField {
            
            static let grayBordered: CGFloat = 10
            
        }
        
        struct Button {
            
            static let externalAuth: CGFloat = 10
            
        }
        
    }
    
    struct BorderWidth {
        
        struct TextField {
            
            static let grayBordered: CGFloat = 1.0
            
        }
        
        struct Button {
            
            static let externalAuth: CGFloat = 1.0
            
        }
        
    }
    
    struct Image {
        
        struct Internal {
            
            static let logo: UIImage = #imageLiteral(resourceName: "logo-icon")
            
        }
        
        struct System {
            
            static let searchTabBarItemImage = UIImage(systemName: "magnifyingglass")
            static let favouritesTabBarItemImage = UIImage(systemName: "heart")
            static let hidePasswordImage = UIImage(systemName: "eye.slash")
            static let showPasswordImage = UIImage(systemName: "eye")
            static let passwordLeftViewImage = UIImage(systemName: "lock")
            static let mailLeftViewImage = UIImage(systemName: "envelope")
            static let searchBarFiltersImage = UIImage(systemName: "line.3.horizontal.decrease.circle")
            static let addToFavouritesImage = UIImage(systemName: "heart")
            static let responsesTabBarItemImage = UIImage(systemName: "envelope")
            static let messagesTabBarItemImage = UIImage(systemName: "message")
            static let profileTabBarItemImage = UIImage(systemName: "person.crop.circle")
            static let closeBarButtonImage = UIImage(systemName: "xmark")
            static let editProfileImage = UIImage(systemName: "pencil")
            
        }
        
    }
    
    struct Width {
        
        struct Button {
            
            static let blueRounded: Int = 320
            static let addToFavourites: Int = 35
            static let externalAuth: Int = 70
            static let authSmallBlue: Int = 170
            static let forgotPassword: Int = 170
            
        }
        
        struct View {
            
            static let vacancyNavigationWord: Int = 100
            static let line: Int = 95
            
        }
        
        struct Image {
         
            static let vacancyCompanyLogo: Int = 50
            
        }
        
        struct ImageView {
            
            static let logo: Int = 130
            
        }
        
    }
    
    struct Height {
        
        struct Button {
            
            static let blueRounded: Int = 45
            static let addToFavourites: Int = 30
            static let vacancyRespond: Int = 32
            static let externalAuth: Int = 40
            static let authSmallBlue: Int = 17
            static let forgotPassword: Int = 15
            
        }
        
        struct View {
            
            static let vacancyNavigationWord: Int = 20
            static let continueWith: Int = 20
            static let line: Int = 1
            
        }
        
        struct Image {
            
            static let vacancyCompanyLogo: Int = 50
            
        }
        
        struct ImageView {
            
            static let logo: Int = 130
            
        }
        
        struct TextField {
            
            static let grayBordered: Int = 40
            
        }
        
    }
    
}
