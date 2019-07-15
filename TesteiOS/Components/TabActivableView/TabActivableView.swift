//
//  TabBarView.swift
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

class MainTabBarActivableView: UIView, TabActivableView {
    let topBorder:CGFloat = 3
    var activeView:UIView = UIView(frame: CGRect.zero)
    var index:Int = 0
    
    var numberOfTabs:Int = 0 {
        didSet {
            updateActivableViewFrame()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    init(frame: CGRect, numberOfTabs: Int) {
        super.init(frame: frame)
        self.numberOfTabs = numberOfTabs
        setup()
    }
    
    func setup() {
        var activableWidth = self.frame.width
        if numberOfTabs > 0 {
            activableWidth = self.frame.width / CGFloat(numberOfTabs)
        }
        let view = UIView(frame: CGRect(x: 0, y: -topBorder, width: activableWidth, height: self.frame.height + topBorder))
        view.backgroundColor = UIColor.orange
        self.addSubview(view)
        self.activeView = view
    }
    
    func updateActivableViewFrame() {
        let width = self.frame.width / CGFloat(self.numberOfTabs)
        self.activeView.frame.size.width = width
        updateActivableViewPosition()
    }
    
    func updateActivableViewPosition() {
        let x = CGFloat(self.index) * activeView.frame.width
        self.activeView.frame.origin.x = x
    }
    
    func setActiveIndex(index: Int) {
        if index < 0 {
            debugPrint("Cannot set an index less than zero")
            return
        }
        if index > numberOfTabs - 1 {
            debugPrint("Cannot set an index greater than or equal to the number of tabs")
            return
        }
        self.index = index
        updateActivableViewPosition()
    }
    
    func getActiveIndex() -> Int {
        return self.index
    }
    
}
