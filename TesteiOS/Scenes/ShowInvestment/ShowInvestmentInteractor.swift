//
//  InvestmentInteractor.swift
//  TesteiOS
//
//  Created by Felipe Costa on 30/06/19.
//  Copyright © 2019 Felipe Costa. All rights reserved.
//

import UIKit


protocol ShowInvestmentBusinessLogic {
    
}


protocol ShowInvestmentDataStore {
    
}


class ShowInvestmentInteractor: ShowInvestmentBusinessLogic, ShowInvestmentDataStore {
    
    var presenter: ShowInvestmentPresentationLogic?
    
}
