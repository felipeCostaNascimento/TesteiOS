//
//  DynamicUILabelGroup.swift
//  TesteiOS
//
//  Created by Felipe Costa on 13/07/19.
//  Copyright © 2019 Felipe Costa. All rights reserved.
//

import UIKit

class DynamicFormLabel: DynamicForm, CustomUIElement {
    typealias T = UILabel
    
    var element:UILabel?
    
    var formCell: FormCell
    
    var customElement: () -> UILabel = {
        return UILabel(frame: CGRect.zero)
    }
    
    required init(formCell: FormCell) {
        self.formCell = formCell
    }
    
    func getUIElement() -> UIView {
        let element = buildElement()
        self.element = element
        return element
    }
    
    func buildElement() -> UILabel {
        let element = customElement()
        element.text = formCell.message
        return element
    }
    
    func validate() -> Bool {
        return true
    }
}
