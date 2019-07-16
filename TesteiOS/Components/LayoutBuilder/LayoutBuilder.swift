//
//  ViewBuilder.swift
//  TesteiOS
//
//  Created by Felipe Costa on 14/07/19.
//  Copyright © 2019 Felipe Costa. All rights reserved.
//

import UIKit


protocol LayoutBuilder {
    func build(subViews:[UIView], layoutMetrics:[LayoutMetrics]) -> [NSLayoutConstraint]?
}

protocol LayoutMetrics {
    func getLayoutMetrics() -> [MetricParams:CGFloat]
    func getDefaultMetrics() -> [MetricParams:CGFloat]
}

enum MetricParams {
    case left
    case top
    case right
    case bottom
    case width
    case height
}



struct SimpleLayoutMetrics: LayoutMetrics {
    var metricParams:[MetricParams:CGFloat]
    
    func getLayoutMetrics() -> [MetricParams : CGFloat] {
        return metricParams
    }
    func getDefaultMetrics() -> [MetricParams : CGFloat] {
        return [.left: 8, .top: 8, .right: 8]
    }
}
