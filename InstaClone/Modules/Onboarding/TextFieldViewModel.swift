//
//  TextFieldViewModel.swift
//  InstaClone
//
//  Created by new on 27/11/2020.
//

import UIKit

protocol TextFieldViewModelDelegate: AnyObject {
    
    func textFieldDidEndEditing(in textFieldType: TextFieldType, with typedText: String)
    
}

struct TextFieldViewModel {
    
    var delegate: TextFieldViewModelDelegate?
    let textFieldType: TextFieldType
    let placeholderText: String
    
    // MARK: - Public methods
    func textFieldDidEndEditing(with typedText: String) {
        print(typedText + " \(self.textFieldType)")
        delegate?.textFieldDidEndEditing(in: self.textFieldType, with: typedText)
    }
    
}
