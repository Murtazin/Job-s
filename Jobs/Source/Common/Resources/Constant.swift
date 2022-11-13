//
//  Constant.swift
//  Jobs
//
//  Created by Renat Murtazin on 21.10.2022.
//

import UIKit

struct Constant {
    
    struct CollectionViewItemSize {
        
        static let searchFilters: CGSize = [150, 30].HResized
        
    }
    
    struct ReuseIdentifier {
        
        static let tableViewCell = "TableViewCell"
        
    }
    
    struct TableSectionFooterHeight {
        
        static let searchFilters: Int = 30
        
    }
    
    struct TableHeaderViewHeight {
        
        static let searchFilters: Int = 50
        
    }
    
    struct TableFooterViewHeight {
        
        static let searchFilters: Int = 70
        
    }
    
    struct TableViewRowHeight {
        
        static let searchVacancies: Int = 232
        static let searchFilters: Int = 50
        static let responsesMain: Int = 160
        
    }
    
    struct NavigationItemTitle {
        
        static let vacanciesForYou = "Вакансии для вас"
        static let responsesMain = "Отклики"
        
    }
    
    struct SystemImageName {
        
        static let filterBookmark = "slider.horizontal.3"
        static let addToFavourites = "heart"
        
    }
    
    struct SymbolConfiguration {
        
        static let pointSize22 = UIImage.SymbolConfiguration(pointSize: 22)
        static let pointSize25 = UIImage.SymbolConfiguration(pointSize: 25)
        
    }
    
    struct SearchBarPlaceholder {
        
        static let position = "Должность, ключевые слова"
        
    }
    
    struct StackViewSpacing {
        
        static let externalAuthButtons: Int = 15
        
    }
    
    struct ButtonTitle {
        
        static let proceed = "Продолжить"
        static let forgotPassword = "Забыли пароль?"
        static let login = "Войти"
        static let create = "Создать"
        static let register = "Регистрация"
        static let respond = "Откликнуться"
        static let addSpecialization = "Добавить специализацию"
        static let reset = "Сбросить"
        
    }
    
    struct LabelText {
        
        static let accessRecovery = "Восстановление доступа"
        static let enterEmailAddress = "Введите адрес электронной почты, привязанный\n к аккаунту"
        static let welcome = "Добро пожаловать"
        static let continueWith = "или продолжить с"
        static let dontHaveAnAccount = "Еще нет аккаунта?"
        static let createAccount = "Создать аккаунт"
        static let accountExist = "Уже есть аккаунт?"
        static let filters = "Фильтры"
        
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
            static let blueRounded: CGFloat = 23
            static let respond: CGFloat = 18
            
        }
        
        struct View {
            
            static let vacancyContainer: CGFloat = 16
            static let responseStatus: CGFloat = 8
            
        }
        
        struct ImageView {
            
            static let companyLogo: CGFloat = 12
            
        }
        
    }
    
    struct BorderWidth {
        
        struct TextField {
            
            static let grayBordered: CGFloat = 1.0
            
        }
        
        struct Button {
            
            static let externalAuth: CGFloat = 1.0
            
        }
        
        struct View {
            
            static let vacancyContainer: CGFloat = 1.0
            static let responseStatus: CGFloat = 1.0
            
        }
        
        struct ImageView {
            
            static let companyLogo: CGFloat = 1.0
            
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
            static let respond: Int = 320
            
        }
        
        struct View {
            
            static let vacancyNavigationWord: Int = 100
            static let line: Int = 95
            static let responseStatus: Int = 100
            
        }
        
        struct Image {
         
            static let vacancyCompanyLogo: Int = 50
            
        }
        
        struct ImageView {
            
            static let logo: Int = 100
            
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
            static let respond: Int = 35
            static let addSpecialization: Int = 34
            
        }
        
        struct View {
            
            static let vacancyNavigationWord: Int = 20
            static let continueWith: Int = 20
            static let line: Int = 1
            static let responseStatus: Int = 25
            
        }
        
        struct Image {
            
            static let vacancyCompanyLogo: Int = 50
            
        }
        
        struct ImageView {
            
            static let logo: Int = 100
            
        }
        
        struct TextField {
            
            static let grayBordered: Int = 40
            
        }
        
        struct Label {
            
            static let searchFiltersSectionHeader: Int = 20
            
        }
        
    }
    
}
