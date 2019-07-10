//
//  InvestmentWorker.swift
//  TesteiOS
//
//  Created by Felipe Costa on 30/06/19.
//  Copyright © 2019 Felipe Costa. All rights reserved.
//

import UIKit


class InvestmentWorker {
    var investmentStore: InvestmentStoreProtocol
    
    init(storeStore: InvestmentStoreProtocol) {
        self.investmentStore = storeStore
    }
    
    func fetchInvestment(completionHandler: @escaping (Investment?) -> Void)
    {
        investmentStore.fetchInvestment { (investment: () throws -> Investment?) -> Void in
            do {
                let investment = try investment()
                DispatchQueue.main.async {
                    completionHandler(investment)
                }
            } catch {
                DispatchQueue.main.async {
                    completionHandler(nil)
                }
            }
        }
    }
}


// MARK: - Investment store API

protocol InvestmentStoreProtocol {
    func fetchInvestment(completionHandler: @escaping (Investment?, InvestmentStoreError?) -> Void)
    
    func fetchInvestment(completionHandler: @escaping InvestmentStoreFetchInvestmentCompletionHandler)
    
    func fetchInvestment(completionHandler: @escaping (() throws -> Investment?) -> Void)
}



// MARK: - Investment store CRUD operation results

typealias InvestmentStoreFetchInvestmentCompletionHandler = (InvestmentStoreResult<Investment?>) -> Void

enum InvestmentStoreResult<U>
{
    case Success(result: U)
    case Failure(error: InvestmentStoreError)
}

// MARK: - Investment store CRUD operation errors

enum InvestmentStoreError: Equatable, Error
{
    case CannotFetch(String)
    case CannotCreate(String)
    case CannotUpdate(String)
    case CannotDelete(String)
}

