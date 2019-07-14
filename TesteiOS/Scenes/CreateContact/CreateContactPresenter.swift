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
        let contactCells = response.contactCells
        var dynamicForms:[DynamicForm] = []
        
        for cc in contactCells {
            var dynamicForm:DynamicForm
            
            switch cc.type {
            case .field:
                dynamicForm = DynamicFormTextField(formCell: cc)
                break
            case .text:
                dynamicForm = DynamicFormTextField(formCell: cc)
                break
            case .image:
                dynamicForm = DynamicFormTextField(formCell: cc)
                break
            case .checkbox:
                dynamicForm = DynamicFormTextField(formCell: cc)
                break
            case .send:
                dynamicForm = DynamicFormTextField(formCell: cc)
                break
            }
            
            dynamicForms.append(dynamicForm)
        }
        let viewModel = CreateContact.FetchContactCells.ViewModel(dynamicForms: dynamicForms)
        viewController?.displayFetchedContactCells(viewModel: viewModel)
    }
}
