//
//  ContactModels.swift
//  TesteiOS
//
//  Created by Felipe Costa on 30/06/19.
//  Copyright © 2019 Felipe Costa. All rights reserved.
//

import UIKit


enum CreateContact {
    
    // MARK: Use cases
    enum FetchContactCells {
        struct Request {
            
        }
        
        struct Response {
            var contactCells: [ContactCell]
        }
        
        struct ViewModel {
            var formElements: [FormElement]
        }
    }
    
    enum FormViewLayout {
        struct Request {
            var formCells: [FormCell]
            var formElements: [UIView]
        }
        
        struct Response {
            var formCells: [FormCell]
            var formElements: [UIView]
        }
        
        struct ViewModel {
            var formConstraints: [NSLayoutConstraint]
        }
    }
}
