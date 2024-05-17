//
//  UINavigation+Ex.swift
//  NewsApp
//
//  Created by M Usman on 17/05/2024.
//

import UIKit

extension UINavigationController {
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        setNavBarappearance()
    }
    
    func setNavBarappearance() {
        guard let image = UIImage(named: "navBackIcon") else {return}
        let backButtonImage = image.withRenderingMode(.alwaysTemplate)
        navigationBar.backIndicatorTransitionMaskImage = backButtonImage
        navigationBar.backIndicatorImage = backButtonImage
        navigationBar.tintColor = .textPrimary
        navigationBar.topItem?.backButtonTitle = ""
        navigationBar.backItem?.title = ""

    }
}


