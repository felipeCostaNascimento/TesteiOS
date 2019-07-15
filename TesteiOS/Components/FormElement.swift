//
//  DynamicFormView.swift
//  TesteiOS
//
//  Created by Felipe Costa on 13/07/19.
//  Copyright © 2019 Felipe Costa. All rights reserved.
//

import UIKit

protocol FormElementBuilder {
    associatedtype T
    var elementBuilder:(FormCell) -> T {get set}
}

protocol FormElement {
    init(formCell: FormCell)
    func validate() -> Bool
    func getUIElement() -> UIView
    func getFormCell() -> FormCell
}


