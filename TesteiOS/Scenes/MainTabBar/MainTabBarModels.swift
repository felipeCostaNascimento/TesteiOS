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
            var tabBarView: TabActivableView
        }
        
        struct ViewModel {
            var tabBarView: TabActivableView
        }
    }
    
    enum TabChangeIndex {
        struct Request {
            var index: Int
        }
        
        struct Response {
        }
        
        struct ViewModel {
        }
    }
}
