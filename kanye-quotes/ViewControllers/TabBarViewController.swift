//
//  TabBarViewController.swift
//  kanye-quotes
//
//  Created by Nick Pappas on 3/28/22.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [quoteNavController(), favoritesNavController()]
    }

    private func quoteNavController() -> UINavigationController {
        let quoteVC = QuoteViewController()
        quoteVC.tabBarItem = UITabBarItem(title: "Quotes", image: UIImage(systemName: "quote.bubble"), tag: 0)
        return UINavigationController(rootViewController: quoteVC)
    }
    
    private func favoritesNavController() -> UINavigationController {
        let favoritesVC = FavoritesViewController()
        favoritesVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        return UINavigationController(rootViewController: favoritesVC)
    }
    
}
