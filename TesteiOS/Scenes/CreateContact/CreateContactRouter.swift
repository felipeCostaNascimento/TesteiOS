//
//  ContactRouter.swift
//  TesteiOS
//
//  Created by Felipe Costa on 30/06/19.
//  Copyright © 2019 Felipe Costa. All rights reserved.
//

import UIKit


protocol CreateContactRoutingLogic {
    
}


class CreateContactRouter: NSObject, CreateContactRoutingLogic {
    
    weak var viewController: CreateContactViewController?
    var dataStore: CreateContactDataStore?
}
