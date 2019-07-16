//
//  VerticalViewBuilder.swift
//  TesteiOS
//
//  Created by Felipe Costa on 14/07/19.
//  Copyright © 2019 Felipe Costa. All rights reserved.
//

import UIKit


class VerticalLayoutBuilder: LayoutBuilder {
    
    func build(subViews: [UIView], layoutMetrics: [LayoutMetrics]) -> [NSLayoutConstraint]? {
        guard subViews.count == layoutMetrics.count else {
            debugPrint("SubViews and layoutMetrics parameters must have the same items count.")
            return nil
        }
        var allConstraints:[NSLayoutConstraint] = []
        let views:[String: Any] = sequencialNameViews(views: subViews)
        
        for i in 0..<views.count {
            let referenceView = i > 0 ? "view\(i-1)" : nil
            let metrics = layoutMetrics[i].getLayoutMetrics()
            let hFormat = createHorizontalFormat(view: "view\(i)", metrics: metrics)
            let vFormat = createVerticalFormat(view: "view\(i)", referenceView: referenceView, metrics: metrics)
            
            allConstraints += createConstraints(hFormat: hFormat, vFormat: vFormat, views: views)
        }
        
        return allConstraints
    }
    
    
    func createConstraints(hFormat:String, vFormat:String, views:[String: Any]) -> [NSLayoutConstraint] {
        return NSLayoutConstraint.constraints(withVisualFormat: hFormat, metrics: nil, views: views)
             + NSLayoutConstraint.constraints(withVisualFormat: vFormat, metrics: nil, views: views)
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
    
    func getSpacingFormat(value:CGFloat?) -> String {
        if let v = value {
            return "-\(v)-"
        }
        return ""
    }
    
    func getSizeFormat(value:CGFloat?) -> String {
        if let v = value {
            return "(\(v))"
        }
        return ""
    }
    
    func createHorizontalFormat(view:String, metrics:[MetricParams:CGFloat]) -> String {
        let format = "H:|:left[:view:width]:right|"
        
        let sLeft = getSpacingFormat(value: metrics[.left])
        let sWidth = getSpacingFormat(value: metrics[.width])
        let sRight = getSpacingFormat(value: metrics[.right])
        
        return format.replacingOccurrences(of: ":left", with: sLeft)
                     .replacingOccurrences(of: ":view", with: view)
                     .replacingOccurrences(of: ":width", with: sWidth)
                     .replacingOccurrences(of: ":right", with: sRight)
    }
    
    func createVerticalFormat(view:String, referenceView:String?, metrics:[MetricParams:CGFloat]) -> String {
        
        let sTop = getSpacingFormat(value: metrics[.top])
        let sHeight = getSizeFormat(value: metrics[.height])
        
        if let rv = referenceView {
            let format = "V:[:referenceView]:top[:view:height]"
            return format.replacingOccurrences(of: ":referenceView", with: rv)
                         .replacingOccurrences(of: ":top", with: sTop)
                         .replacingOccurrences(of: ":view", with: view)
                         .replacingOccurrences(of: ":height", with: sHeight)
        } else {
            let format = "V:|:top[:view:height]"
            return format.replacingOccurrences(of: ":top", with: sTop)
                         .replacingOccurrences(of: ":view", with: view)
                         .replacingOccurrences(of: ":height", with: sHeight)
        }
        
    }
    
}
