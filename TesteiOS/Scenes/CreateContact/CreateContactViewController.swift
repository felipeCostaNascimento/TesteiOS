//
//  ContactViewController.swift
//  TesteiOS
//
//  Created by Felipe Costa on 30/06/19.
//  Copyright © 2019 Felipe Costa. All rights reserved.
//

import UIKit


protocol CreateContactDisplayLogic: class {
    func displayFetchedContactCells(viewModel: CreateContact.FetchContactCells.ViewModel)
    func displayBuiltFormView(viewModel: CreateContact.BuildFormView.ViewModel)
}



class CreateContactViewController: UIViewController {
    
    var interactor: CreateContactBusinessLogic?
    var router: (NSObjectProtocol & CreateContactRoutingLogic)?
    
    
    var formElements: [FormElement] = []
    
    @IBOutlet weak var formContainer: UIStackView!
    
    
    
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    
    // MARK: Setup
    
    private func setup() {
        let viewController = self
        let interactor = CreateContactInteractor()
        let presenter = CreateContactPresenter()
        let router = CreateContactRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    
    // MARK: Routing
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchContactCells()
    }
    
    
    func fetchContactCells() {
        let request = CreateContact.FetchContactCells.Request()
        interactor?.fetchContactCells(request: request)
    }
    
    
}


extension CreateContactViewController: CreateContactDisplayLogic {
    func displayFetchedContactCells(viewModel: CreateContact.FetchContactCells.ViewModel) {
        formElements = viewModel.formElements
        let request = CreateContact.BuildFormView.Request(formElements: formElements)
        interactor?.buildFormView(request: request)
    }
    
    func displayBuiltFormView(viewModel: CreateContact.BuildFormView.ViewModel) {
        self.view.addSubview(viewModel.formView)
    }
}
