//
//  MainTabBar.swift
//  TesteiOS
//
//  Created by Felipe Costa on 06/07/19.
//  Copyright © 2019 Felipe Costa. All rights reserved.
//

import UIKit

enum MainTabBar {
    
    enum TabBarView {
        struct Request {
            var tabBar: UITabBar
        }
        
        struct Response {
            var tabBar: UITabBar
        }
        
        struct ViewModel {
            var tabBarView: TabActivableView
        }
    }
    
}
