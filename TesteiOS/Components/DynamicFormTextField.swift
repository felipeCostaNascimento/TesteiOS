//
//  DynamicFormTextField.swift
//  TesteiOS
//
//  Created by Felipe Costa on 13/07/19.
//  Copyright © 2019 Felipe Costa. All rights reserved.
//

import UIKit


class FormTextField: FormElement, FormElementBuilder {
    typealias T = UITextField
    
    var element:UITextField?
    var formCell: FormCell
    
    required init(formCell: FormCell) {
        self.formCell = formCell
    }
    
    var elementBuilder: (FormCell) -> UITextField = { cell in
        let element = UITextField(frame: CGRect.zero)
        element.placeholder = cell.message
        element.isHidden = cell.hidden
        return element
    }
    
    func getUIElement() -> UIView {
        let element = elementBuilder(formCell)
        self.element = element
        return element
    }
    
    func getFormCell() -> FormCell {
        return formCell
    }
    
    func validate() -> Bool {
        guard let uiElement = self.element else { return false }
        
        let element = uiElement
        let cell = formCell
        
        guard let text = element.text else {
            return false
        }
        
        let cleanText = text.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if cleanText == "", cell.required {
            return false
        }
        
        if let tf = cell.typefield {
            if cell.required && !tf.validateFieldValue(value: element.text) {
                return false
            }
        }
            
        return true
    }
}
