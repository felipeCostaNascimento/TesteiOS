//
//  ContactPresenter.swift
//  TesteiOS
//
//  Created by Felipe Costa on 30/06/19.
//  Copyright © 2019 Felipe Costa. All rights reserved.
//

import UIKit


protocol CreateContactPresentationLogic {
    func presentFetchedContactCells(response: CreateContact.FetchContactCells.Response)
}


class CreateContactPresenter {
    
    weak var viewController: CreateContactDisplayLogic?
}

extension CreateContactPresenter: CreateContactPresentationLogic {
    func presentFetchedContactCells(response: CreateContact.FetchContactCells.Response) {
        let viewModel = CreateContact.FetchContactCells.ViewModel(contactCells: response.contactCells)
        viewController?.displayFetchedContactCells(viewModel: viewModel)
    }
}
