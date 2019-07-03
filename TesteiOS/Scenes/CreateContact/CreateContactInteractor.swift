//
//  ContactInteractor.swift
//  TesteiOS
//
//  Created by Felipe Costa on 30/06/19.
//  Copyright © 2019 Felipe Costa. All rights reserved.
//

import UIKit


protocol CreateContactBusinessLogic {
    
}


protocol CreateContactDataStore {
    
}


class CreateContactInteractor: CreateContactBusinessLogic, CreateContactDataStore {
    
    var presenter: CreateContactPresentationLogic?
    
}
