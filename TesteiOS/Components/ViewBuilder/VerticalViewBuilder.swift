//
//  VerticalViewBuilder.swift
//  TesteiOS
//
//  Created by Felipe Costa on 14/07/19.
//  Copyright © 2019 Felipe Costa. All rights reserved.
//

import UIKit


class VerticalViewBuilder: ViewBuilder {
    func build(subViews: [UIView]) -> [NSLayoutConstraint] {
        var allConstraints:[NSLayoutConstraint] = []
        var count = 0
        let views:[String: Any] = sequencialNameViews(views: subViews)
        
        
        for _ in views {
            let hString = "H:|-0-[view\(count)]-0-|"
            let vString = count > 0 ? "V:[view\(count-1)]-20-[view\(count)]" : "V:|-20-[view\(count)]"
//            let vString = "V:|-60-[view\(count)]"
            let viewHorizontalConstraint = NSLayoutConstraint.constraints(withVisualFormat: hString, metrics: nil, views: views)
            let viewVerticalConstraint = NSLayoutConstraint.constraints(withVisualFormat: vString, metrics: nil, views: views)
            
            allConstraints += viewHorizontalConstraint
            allConstraints += viewVerticalConstraint
            count += 1
        }
        
        return allConstraints
    }
    
    
    
    func sequencialNameViews(views:[UIView]) -> [String:Any] {
        var nameViews:[String: Any] = [:]
        var count = 0
        
        for v in views {
            let key = "view\(count)"
            nameViews[key] = v
            count += 1
        }
        
        return nameViews
    }
    
}
