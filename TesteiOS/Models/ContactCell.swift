//
//  ContactCell.swift
//  TesteiOS
//
//  Created by Felipe Costa on 30/06/19.
//  Copyright © 2019 Felipe Costa. All rights reserved.
//

import Foundation

struct ContactCell: FormCell {
    var id: Int
    var type: CellType
    var message: String
    var typefield: TypeField?
    var hidden: Bool
    var topSpacing: Float
    var show: Int?
    var required: Bool
}

protocol FormCell {
    var id: Int {get set}
    var type: CellType {get set}
    var message: String {get set}
    var typefield: TypeField? {get set}
    var hidden: Bool {get set}
    var topSpacing: Float {get set}
    var show: Int? {get set}
    var required: Bool {get set}
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



extension ContactCell {
    init?(json: [String:Any]) {
        guard let id =          json["id"] as? Int,
            let type =          json["type"] as? Int,
            let message =       json["message"] as? String,
            let typefield =     json["typefield"],
            let hidden =        json["hidden"] as? Bool,
            let topSpacing =    json["topSpacing"] as? Float,
            let show =          json["show"],
            let required =      json["required"] as? Bool
        else {
            return nil
        }
        
        if let ct = CellType(rawValue: type) {
            self.type = ct
        } else {
            return nil
        }
        
        if let tf = typefield as? Int {
            if let field = TypeField.Field(rawValue: tf) {
                self.typefield = TypeField(typeField: field)
            } else {
                return nil
            }
        }
        
        self.id = id
        self.message = message
        self.hidden = hidden
        self.topSpacing = topSpacing
        self.show = show as? Int
        self.required = required
    }
}
