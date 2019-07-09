//
//  MainTabBarInteractor.swift
//  TesteiOS
//
//  Created by Felipe Costa on 06/07/19.
//  Copyright © 2019 Felipe Costa. All rights reserved.
//

import UIKit


protocol MainTabBarBusinessLogic {
    func configureTabBarLayout(request: MainTabBar.TabBarView.Request)
}

protocol MainTabBarDataStore {
}

class MainTabBarInteractor {
    var presenter: MainTabBarPresentationLogic?
}

extension MainTabBarInteractor: MainTabBarBusinessLogic {
    func configureTabBarLayout(request: MainTabBar.TabBarView.Request) {
        
        let response = MainTabBar.TabBarView.Response(tabBar: request.tabBar)
        presenter?.presentTabBarView(response: response)
    }
}


extension MainTabBarInteractor: MainTabBarDataStore {
    
}
