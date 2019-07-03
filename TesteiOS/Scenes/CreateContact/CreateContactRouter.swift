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

protocol CreateContactDataPassing {
    
}


class CreateContactRouter: NSObject, CreateContactRoutingLogic, CreateContactDataPassing {
    
    weak var viewController: CreateContactViewController?
    var dataStore: CreateContactDataStore?
}
