//
//  ContactInteractor.swift
//  TesteiOS
//
//  Created by Felipe Costa on 30/06/19.
//  Copyright © 2019 Felipe Costa. All rights reserved.
//

import UIKit


protocol CreateContactBusinessLogic {
    func fetchContactCells(request: CreateContact.FetchContactCells.Request)
    func buildFormView(request: CreateContact.BuildFormView.Request)
}


protocol CreateContactDataStore {
    var contactCells: [ContactCell]? {get}
}


class CreateContactInteractor: CreateContactDataStore {
    
    var presenter: CreateContactPresentationLogic?
    var contactCellsWorker = ContactCellsWorker(storeStore: ContactCellsAPI())
    var contactCells: [ContactCell]?
}

extension CreateContactInteractor: CreateContactBusinessLogic {
    func fetchContactCells(request: CreateContact.FetchContactCells.Request) {
        contactCellsWorker.fetchContactCells { (contactCells) in
            self.contactCells = contactCells
            let response = CreateContact.FetchContactCells.Response(contactCells: contactCells)
            self.presenter?.presentFetchedContactCells(response: response)
        }
    }
    
    func buildFormView(request: CreateContact.BuildFormView.Request) {
        let response = CreateContact.BuildFormView.Response(formElements: request.formElements)
        self.presenter?.presentBuildFormView(response: response)
    }
}

