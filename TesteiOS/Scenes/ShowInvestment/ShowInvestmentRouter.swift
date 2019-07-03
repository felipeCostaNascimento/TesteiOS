//
//  InvestmentRouter.swift
//  TesteiOS
//
//  Created by Felipe Costa on 30/06/19.
//  Copyright © 2019 Felipe Costa. All rights reserved.
//

import UIKit


protocol ShowInvestmentRoutingLogic {
    
}

protocol ShowInvestmentDataPassing {
    
}


class ShowInvestmentRouter: NSObject, ShowInvestmentRoutingLogic, ShowInvestmentDataPassing {
    
    weak var viewController: ShowInvestmentViewController?
    var dataStore: ShowInvestmentDataStore?
}
