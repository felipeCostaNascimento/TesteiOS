//
//  SuccessContactRouter.swift
//  TesteiOS
//
//  Created by Felipe Costa on 03/07/19.
//  Copyright © 2019 Felipe Costa. All rights reserved.
//

import UIKit


protocol SuccessContactRoutingLogic {
    
}


class SuccessContactRouter: NSObject, SuccessContactRoutingLogic {
    
    weak var viewController: SuccessContactViewController?
    var dataStore: SuccessContactDataStore?
}
