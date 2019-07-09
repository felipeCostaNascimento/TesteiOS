//
//  ContactCellsWorker.swift
//  TesteiOS
//
//  Created by Felipe Costa on 30/06/19.
//  Copyright © 2019 Felipe Costa. All rights reserved.
//

import Foundation


class ContactCellsWorker {
    var contactCellsStore: ContactCellsStoreProtocol
    
    init(storeStore: ContactCellsStoreProtocol) {
        self.contactCellsStore = storeStore
    }
    
    func fetchContactCells(completionHandler: @escaping ([ContactCell]) -> Void)
    {
        contactCellsStore.fetchContactCells { (contactCells: () throws -> [ContactCell]) -> Void in
            do {
                let contactCells = try contactCells()
                DispatchQueue.main.async {
                    completionHandler(contactCells)
                }
            } catch {
                DispatchQueue.main.async {
                    completionHandler([])
                }
            }
        }
    }
}


// MARK: - ContactCells store API

protocol ContactCellsStoreProtocol {
    func fetchContactCells(completionHandler: @escaping ([ContactCell], ContactCellsStoreError?) -> Void)
    
    func fetchContactCells(completionHandler: @escaping ContactCellsStoreFetchContactCellsCompletionHandler)
    
    func fetchContactCells(completionHandler: @escaping (() throws -> [ContactCell]) -> Void)
}



// MARK: - ContactCells store CRUD operation results

typealias ContactCellsStoreFetchContactCellsCompletionHandler = (ContactCellsStoreResult<[ContactCell]>) -> Void

enum ContactCellsStoreResult<U>
{
    case Success(result: U)
    case Failure(error: ContactCellsStoreError)
}

// MARK: - ContactCells store CRUD operation errors

enum ContactCellsStoreError: Equatable, Error
{
    case CannotFetch(String)
    case CannotCreate(String)
    case CannotUpdate(String)
    case CannotDelete(String)
}

