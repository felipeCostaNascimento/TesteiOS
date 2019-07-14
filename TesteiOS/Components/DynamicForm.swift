//
//  DynamicFormView.swift
//  TesteiOS
//
//  Created by Felipe Costa on 13/07/19.
//  Copyright © 2019 Felipe Costa. All rights reserved.
//

import UIKit

protocol CustomUIElement {
    associatedtype T
    var customElement:() -> T {get set}
}

protocol DynamicForm {
    init(formCell: FormCell)
    func validate() -> Bool
    func getUIElement() -> UIView
}


protocol FormBuilder {
    func build(elements:[UIView]) -> UIView
}


class DynamicFormVerticalBuilder: FormBuilder {
    func build(elements: [UIView]) -> UIView {
        return UIView(frame: CGRect.zero)
    }
    
}
