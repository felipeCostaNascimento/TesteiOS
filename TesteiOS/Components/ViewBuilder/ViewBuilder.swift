//
//  ViewBuilder.swift
//  TesteiOS
//
//  Created by Felipe Costa on 14/07/19.
//  Copyright © 2019 Felipe Costa. All rights reserved.
//

import UIKit


protocol ViewBuilder {
    func build(subViews:[UIView]) -> [NSLayoutConstraint]
}


