//
//  Resources.swift
//  RickAndMortyApp
//
//  Created by Владимир Повальский on 06.09.2023.
//

import Foundation
import UIKit

enum R {
    
    static let widthScreen = UIScreen.main.bounds.width
    static let heightScreen = UIScreen.main.bounds.height
    
    enum Titles {
        static let welcomeDescription = NSLocalizedString("welcome_description", comment: "")
        static let startButton = NSLocalizedString("start_button", comment: "")
    }
    
    enum Images {
        static let rickAndMortyLogo = UIImage(named: "RickAndMortyLogo") ?? UIImage(systemName: "")
    }
    
    enum Fonts {
        static let avenirMedium18 = UIFont(name: "Avenir-Medium", size: 18)
    }
}
