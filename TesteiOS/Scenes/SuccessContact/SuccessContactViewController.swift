//
//  SuccessContactViewController.swift
//  TesteiOS
//
//  Created by Felipe Costa on 03/07/19.
//  Copyright © 2019 Felipe Costa. All rights reserved.
//

import UIKit


protocol SuccessContactDisplayLogic: class {
    
}


class SuccessContactViewController: UIViewController {
    
    var interactor: SuccessContactBusinessLogic?
    var router: (NSObjectProtocol & SuccessContactRoutingLogic)?
    
    
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    
    // MARK: Setup
    
    private func setup() {
        
    }
    
    
    // MARK: Routing
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
}
