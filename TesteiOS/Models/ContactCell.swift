//
//  ContactCell.swift
//  TesteiOS
//
//  Created by Felipe Costa on 30/06/19.
//  Copyright © 2019 Felipe Costa. All rights reserved.
//

import Foundation

struct ContactCell {
    var id: Int
    var type: CellType
    var message: String
    var typefield: TypeField?
    var hidden: Bool
    var topSpacing: Float
    var show: Int?
    var required: Bool
}


enum CellType: Int {
    case field = 1 //textfield
    case text //label
    case image //imageview
    case checkbox //checkbox
    case send //button
}


struct TypeField {
    enum Field: Int {
        case text = 1
        case telNumber
        case email
    }
    var typeField: Field
    
    func validateFieldValue(value:String?) -> Bool {
        guard var text = value else { return false }
        text = text.trimmingCharacters(in: .whitespacesAndNewlines)
        
        switch typeField {
        case .text:
            return text != ""
        case .telNumber:
            return text.validatePhone()
        case .email:
            return text.validateEmail()
        }
    }
}


