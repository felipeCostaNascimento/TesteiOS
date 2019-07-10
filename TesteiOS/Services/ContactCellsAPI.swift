//
//  ContactCellsAPI.swift
//  TesteiOS
//
//  Created by Felipe Costa on 30/06/19.
//  Copyright © 2019 Felipe Costa. All rights reserved.
//

import Foundation

class ContactCellsAPI: APIConfig {
    var serviceConfiguration = Configuration(service: "cells.json")
    
    
    func fetchData(url: URL, completion: @escaping ([ContactCell]?) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let resultData = data, error == nil, let httpResponse = response as? HTTPURLResponse, self.serviceConfiguration.isStatusValid(status: httpResponse.statusCode) {
                var contactCells: [ContactCell] = []
                do {
                    let json = try JSONSerialization.jsonObject(with: resultData, options: .allowFragments)
                    if let dict = json as? NSDictionary, let cells = dict["cells"] as? [[String:Any]] {
                        for cell in cells {
                            if let cc = ContactCell(json: cell) {
                                contactCells.append(cc)
                            }
                        }
                        completion(contactCells)
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

extension ContactCellsAPI: ContactCellsStoreProtocol {
    func fetchContactCells(completionHandler: @escaping ([ContactCell], ContactCellsStoreError?) -> Void) {
        guard let url = URL(string: serviceConfiguration.fullEndpoint()) else {
            completionHandler([], ContactCellsStoreError.CannotFetch("Wrong url service \(serviceConfiguration.fullEndpoint())"))
            return
        }
        fetchData(url: url) { (result) in
            if let successResult = result {
                completionHandler(successResult, nil)
            } else {
                completionHandler([], ContactCellsStoreError.CannotFetch("Cannot fetch contact cells"))
            }
        }
    }
    
    func fetchContactCells(completionHandler: @escaping ContactCellsStoreFetchContactCellsCompletionHandler) {
        guard let url = URL(string: serviceConfiguration.fullEndpoint()) else {
            completionHandler(ContactCellsStoreResult.Failure(error: ContactCellsStoreError.CannotFetch("Cannot fetch contact cells")))
            return
        }
        fetchData(url: url) { (result) in
            if let successResult = result {
                completionHandler(ContactCellsStoreResult.Success(result: successResult))
            } else {
                completionHandler(ContactCellsStoreResult.Failure(error: ContactCellsStoreError.CannotFetch("Cannot fetch contact cells")))
            }
        }
    }
    
    func fetchContactCells(completionHandler: @escaping (() throws -> [ContactCell]) -> Void) {
        guard let url = URL(string: serviceConfiguration.fullEndpoint()) else {
            completionHandler{ return [] }
            return
        }
        fetchData(url: url) { (result) in
            completionHandler{ return result ?? [] }
        }
    }
}
