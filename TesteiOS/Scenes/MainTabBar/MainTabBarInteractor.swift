//
//  MainTabBarInteractor.swift
//  TesteiOS
//
//  Created by Felipe Costa on 06/07/19.
//  Copyright © 2019 Felipe Costa. All rights reserved.
//

import UIKit


protocol TabActivableView: UIView {
    var activeView: UIView {get}
    func setActiveIndex(index:Int)
    func getActiveIndex() -> Int
}

protocol MainTabBarBusinessLogic {
    func configureTabBarLayout(request: MainTabBar.TabBarView.Request)
    func tabDidChange(request: MainTabBar.TabChangeIndex.Request)
}

protocol MainTabBarDataStore {
    var tabBarView: TabActivableView? {get}
}

class MainTabBarInteractor: MainTabBarBusinessLogic, MainTabBarDataStore {
    
    var presenter: MainTabBarPresentationLogic?
    var tabBarView: TabActivableView?
    
    
    func configureTabBarLayout(request: MainTabBar.TabBarView.Request) {
        tabBarView = MainTabBarActivableView(frame: request.tabBar.bounds, numberOfTabs: request.tabBar.items?.count ?? 0)
        let response = MainTabBar.TabBarView.Response(tabBar: request.tabBar, tabBarView: self.tabBarView!)
        presenter?.presentTabBarView(response: response)
    }
    
    func tabDidChange(request: MainTabBar.TabChangeIndex.Request) {
        if request.index != tabBarView?.getActiveIndex() {
            tabBarView?.setActiveIndex(index: request.index)
        }
    }
}
