//
//  MainTabBarPresenter.swift
//  TesteiOS
//
//  Created by Felipe Costa on 06/07/19.
//  Copyright © 2019 Felipe Costa. All rights reserved.
//

import UIKit


protocol MainTabBarPresentationLogic {
    func presentTabBarView(response: MainTabBar.TabBarView.Response)
}


class MainTabBarPresenter: MainTabBarPresentationLogic {
    weak var viewController: MainTabBarDisplayLogic?
    
    
    func presentTabBarView(response: MainTabBar.TabBarView.Response) {
        adjustTabBarFont()
        if let items = response.tabBar.items {
            adjustTabBarItemsVerticalPosition(items: items, yPos: -14)
        }
        let tabBarView = response.tabBarView
        tabBarView.activeView.backgroundColor = UIColor.appColorDarkRed
        tabBarView.backgroundColor = UIColor.appColorRed

        let viewModel = MainTabBar.TabBarView.ViewModel(tabBarView: tabBarView)
        viewController?.displayTabBarView(viewModel: viewModel)
    }
    
    func adjustTabBarItemsVerticalPosition(items:[UITabBarItem], yPos: CGFloat) {
        for item in items {
            item.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: yPos)
        }
    }
    
    func adjustTabBarFont() {
        let attributes:[NSAttributedString.Key : Any] = [
            NSAttributedString.Key.font: UIFont(name: "DINNeuzeitGroteskStd-Light", size: 16)!,
            NSAttributedString.Key.foregroundColor: UIColor.white
        ]
        UITabBarItem.appearance().setTitleTextAttributes(attributes, for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes(attributes, for: .selected)
        
    }
    
}
