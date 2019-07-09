//
//  ContactCellsAPI.swift
//  TesteiOS
//
//  Created by Felipe Costa on 30/06/19.
//  Copyright © 2019 Felipe Costa. All rights reserved.
//

import Foundation

class ContactCellsAPI: ContactCellsStoreProtocol {
    
    let endpoint = "cells.json"
    
    func fetchContactCells(completionHandler: @escaping ([ContactCell], ContactCellsStoreError?) -> Void) {

    }
    
    func fetchContactCells(completionHandler: @escaping ContactCellsStoreFetchContactCellsCompletionHandler) {
        
    }
    
    func fetchContactCells(completionHandler: @escaping (() throws -> [ContactCell]) -> Void) {
        
    }
    
    
    
    func load(url: URL, completion: @escaping () -> ()) {
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let resultData = data, error == nil {
                print(resultData)
            } else {
                print(error!.localizedDescription)
            }
        }
    }
    
}
