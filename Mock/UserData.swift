//
//  UserData.swift
//  Mock
//
//  Created by Michelle NW on 6/15/17.
//
//

import UIKit

class UserData {
    
    //MARK: Properties
    
    var color: String
    var code: String
    var name: String
    
    //MARK: Initialization
    init?(color: String, code: String, name:String) {
        
        // If any of input is empty, fail it
        if color.isEmpty || code.isEmpty || name.isEmpty {
            return nil
        }
        
        // Initialize stored properties
        self.color = color
        self.code = code
        self.name = name
    }
    
}
