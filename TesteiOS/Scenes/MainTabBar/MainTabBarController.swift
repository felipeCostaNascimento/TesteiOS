//
//  MainTabBarController.swift
//  TesteiOS
//
//  Created by Felipe Costa on 03/07/19.
//  Copyright © 2019 Felipe Costa. All rights reserved.
//

import UIKit


protocol MainTabBarDisplayLogic: class {
    func displayTabBarView(viewModel: MainTabBar.TabBarView.ViewModel)
}

class MainTabBarController: UITabBarController {
    var interactor: MainTabBarBusinessLogic?
    var tabBarView: TabActivableView?
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    
    func setup() {
        let viewController = self
        let interactor = MainTabBarInteractor()
        let presenter = MainTabBarPresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabBarItemsLayout()
    }
    
    
    func configureTabBarItemsLayout() {
        let request = MainTabBar.TabBarView.Request(tabBar: self.tabBar)
        interactor?.configureTabBarLayout(request: request)
    }
}

extension MainTabBarController: UITabBarControllerDelegate {
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        guard let items = tabBar.items else { return }
        guard let tbv = tabBarView else { return }
        
        var index = 0
        for i in items {
            if i == item {
                break;
            }
            index += 1
        }
        tbv.setActiveIndex(index: index)
    }
}


extension MainTabBarController: MainTabBarDisplayLogic {
    func displayTabBarView(viewModel: MainTabBar.TabBarView.ViewModel) {
        self.tabBarView = viewModel.tabBarView
        self.tabBar.insertSubview(viewModel.tabBarView, at: 0)
    }
}
