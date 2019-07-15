//
//  DynamicUILabelGroup.swift
//  TesteiOS
//
//  Created by Felipe Costa on 13/07/19.
//  Copyright © 2019 Felipe Costa. All rights reserved.
//

import UIKit

class FormLabel: FormElement, FormElementBuilder {
    typealias T = UILabel
    
    var element:UILabel?
    
    var formCell: FormCell
    
    var elementBuilder: (FormCell) -> UILabel = { cell in
        return UILabel(frame: CGRect.zero)
    }
    
    required init(formCell: FormCell) {
        self.formCell = formCell
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
        return true
    }
}
