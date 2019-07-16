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
    func presentBuildFormView(response: CreateContact.FormViewLayout.Response)
}


class CreateContactPresenter {
    
    weak var viewController: CreateContactDisplayLogic?
}

extension CreateContactPresenter: CreateContactPresentationLogic {
    func presentFetchedContactCells(response: CreateContact.FetchContactCells.Response) {
        let contactCells = response.contactCells
        var dynamicForms:[FormElement] = []
        
        for cc in contactCells {
            var dynamicForm:FormElement
            
            switch cc.type {
            case .field:
                dynamicForm = FormTextField(formCell: cc)
                break
            case .text:
                dynamicForm = FormLabel(formCell: cc)
                break
            case .image:
                dynamicForm = FormTextField(formCell: cc)
                break
            case .checkbox:
                dynamicForm = FormTextField(formCell: cc)
                break
            case .send:
                dynamicForm = FormTextField(formCell: cc)
                break
            }
            
            dynamicForms.append(dynamicForm)
        }
        let viewModel = CreateContact.FetchContactCells.ViewModel(formElements: dynamicForms)
        viewController?.displayFetchedContactCells(viewModel: viewModel)
    }
    
    
    func presentBuildFormView(response: CreateContact.FormViewLayout.Response) {
        let formBuilder = VerticalLayoutBuilder()
        let metrics = response.formCells.map{ cell in return SimpleLayoutMetrics(metricParams: [.top: cell.topSpacing, .left: 0, .right: 0]) }
        if let constrainsts = formBuilder.build(subViews: response.formElements, layoutMetrics: metrics) {
            let viewModel = CreateContact.FormViewLayout.ViewModel(formConstraints: constrainsts)
            viewController?.displayBuiltFormView(viewModel: viewModel)
        }
    }
}
