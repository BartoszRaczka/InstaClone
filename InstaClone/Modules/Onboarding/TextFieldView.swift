//
//  TextFieldView.swift
//  InstaClone
//
//  Created by new on 27/11/2020.
//

import SnapKit

class TextFieldView: UIView {
    
    let viewModel: TextFieldViewModel
    
    private var container: UIView!
    private var textField: UITextField!
    
    init(with viewModel: TextFieldViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
    
        setupContainer()
        setupTextField()
    }
    
    required init?(coder: NSCoder) {
        nil
    }
    
}

// MARK: - View setup
private extension TextFieldView {
    
    func setupContainer() {
        container = UIView()
        addSubview(container)
        
        container.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func setupTextField() {
        textField = UITextField()
        addSubview(textField)
        
        textField.placeholder = viewModel.placeholderText
        textField.borderStyle = .roundedRect
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.keyboardType = UIKeyboardType.emailAddress
        textField.returnKeyType = UIReturnKeyType.done
        textField.clearButtonMode = UITextField.ViewMode.whileEditing
        textField.contentVerticalAlignment = .center
        textField.contentHorizontalAlignment = .leading
        textField.delegate = self
        
        textField.snp.makeConstraints { make in
            make.top.bottom.equalTo(container).inset(6.0)
            make.leading.trailing.equalTo(container).inset(12.0)
        }
    }
    
}

extension TextFieldView: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        guard let typedText = textField.text,
              typedText != ""
        else {
            return
        }
        viewModel.textFieldDidEndEditing(with: typedText)
    }

}
