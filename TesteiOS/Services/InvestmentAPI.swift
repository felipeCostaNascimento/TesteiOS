//
//  InvestmentAPI.swift
//  TesteiOS
//
//  Created by Felipe Costa on 30/06/19.
//  Copyright © 2019 Felipe Costa. All rights reserved.
//

import UIKit


class InvestmentAPI: APIConfig {
    var serviceConfiguration = Configuration(service: "fund.json")
    
    func fetchData(url: URL, completion: @escaping (Investment?) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let resultData = data, error == nil, let httpResponse = response as? HTTPURLResponse, self.serviceConfiguration.isStatusValid(status: httpResponse.statusCode) {
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
        guard let url = URL(string: serviceConfiguration.fullEndpoint()) else {
            completionHandler(nil, InvestmentStoreError.CannotFetch("Wrong url service \(serviceConfiguration.fullEndpoint())"))
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
        guard let url = URL(string: serviceConfiguration.fullEndpoint()) else {
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
        guard let url = URL(string: serviceConfiguration.fullEndpoint()) else {
            completionHandler{ return nil }
            return
        }
        fetchData(url: url) { (investment) in
            completionHandler{ return investment }
        }
    }
    
    
}
