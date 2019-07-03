//
//  SuccessContactInteractor.swift
//  TesteiOS
//
//  Created by Felipe Costa on 03/07/19.
//  Copyright © 2019 Felipe Costa. All rights reserved.
//

import UIKit


protocol SuccessContactBusinessLogic {
    
}


protocol SuccessContactDataStore {
    
}


class SuccessContactInteractor: SuccessContactBusinessLogic, SuccessContactDataStore {
    
    var presenter: SuccessContactPresentationLogic?
    
}

