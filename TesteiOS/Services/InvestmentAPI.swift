//
//  InvestmentAPI.swift
//  TesteiOS
//
//  Created by Felipe Costa on 30/06/19.
//  Copyright © 2019 Felipe Costa. All rights reserved.
//

import UIKit


class InvestmentAPI: DataAPI {
    var config: APIConfigurationProtocol
    
    init() {
        self.config = APIConfig(serviceName: "cells.json")!
    }
    
    func fetchData(url: URL, completion: @escaping (Investment?) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let resultData = data, error == nil, let httpResponse = response as? HTTPURLResponse, self.config.isStatusValid(status: httpResponse.statusCode) {
                do {
                    let json = try JSONSerialization.jsonObject(with: resultData, options: .allowFragments)
                    if let dict = json as? NSDictionary, let data = dict["screen"] as? [String:Any] {
                        completion(Investment(json: data))
                    } else {
                        completion(nil)
                    }
                }catch {
                    completion(nil)
                }
            } else {
                completion(nil)
            }
        }
        task.resume()
    }
}

extension InvestmentAPI: InvestmentStoreProtocol {
    func fetchInvestment(completionHandler: @escaping (Investment?, InvestmentStoreError?) -> Void) {
        guard let url = URL(string: config.serviceEndpoint()) else {
            completionHandler(nil, InvestmentStoreError.CannotFetch("Wrong url service \(config.serviceEndpoint())"))
            return
        }
        fetchData(url: url) { (result) in
            if let successResult = result {
                completionHandler(successResult, nil)
            } else {
                completionHandler(nil, InvestmentStoreError.CannotFetch("Cannot fetch investment"))
            }
        }
    }
    
    func fetchInvestment(completionHandler: @escaping InvestmentStoreFetchInvestmentCompletionHandler) {
        guard let url = URL(string: config.serviceEndpoint()) else {
            completionHandler(InvestmentStoreResult.Failure(error: InvestmentStoreError.CannotFetch("Cannot fetch investment")))
            return
        }
        fetchData(url: url) { (result) in
            if let successResult = result {
                completionHandler(InvestmentStoreResult.Success(result: successResult))
            } else {
                completionHandler(InvestmentStoreResult.Failure(error: InvestmentStoreError.CannotFetch("Cannot fetch investment")))
            }
        }
    }
    
    func fetchInvestment(completionHandler: @escaping (() throws -> Investment?) -> Void) {
        guard let url = URL(string: config.serviceEndpoint()) else {
            completionHandler{ return nil }
            return
        }
        fetchData(url: url) { (investment) in
            completionHandler{ return investment }
        }
    }
    
    
}
