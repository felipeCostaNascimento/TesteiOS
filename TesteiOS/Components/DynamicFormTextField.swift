//
//  DynamicFormTextField.swift
//  TesteiOS
//
//  Created by Felipe Costa on 13/07/19.
//  Copyright © 2019 Felipe Costa. All rights reserved.
//

import UIKit


class DynamicFormTextField: DynamicForm, CustomUIElement {
    typealias T = UITextField
    
    var element:UITextField?
    var formCell: FormCell
    
    var customElement: () -> UITextField = {
        return UITextField(frame: CGRect.zero)
    }
    
    required init(formCell: FormCell) {
        self.formCell = formCell
    }
    
    func getUIElement() -> UIView {
        let element = buildElement()
        self.element = element
        return element
    }
    
    func buildElement() -> UITextField {
        let element = customElement()
        element.text = formCell.message
        return element
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
