//
//  TextFieldViewModel.swift
//  InstaClone
//
//  Created by new on 27/11/2020.
//

import UIKit

protocol TextFieldViewModelDelegate: AnyObject {
    
    func textChanged(in textFieldType: TextFieldType)
    
}

struct TextFieldViewModel {
    
//    var delegate: TextFieldViewModelDelegate?
    var placeholderText: String
    
}
