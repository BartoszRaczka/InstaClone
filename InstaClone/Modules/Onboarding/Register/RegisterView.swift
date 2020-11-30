//
//  RegisterView.swift
//  InstaClone
//
//  Created by new on 25/11/2020.
//

import SnapKit

final class RegisterView: UIView {
    
    // MARK: - Properties
    
    private let viewModel: RegisterViewModel
    
    private var topLabel: UILabel!
    private var textField: UITextField!
    private var button: UIButton!
    
    // MARK: - Life Cycle
    
    init(viewModel: RegisterViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        nil
    }
    
    // MARK: - Public methods
    
    func setupView() {
        
        backgroundColor = .black
        
        setupTopLabel()
        setupTextField()
        setupButton()
    }
    
}

    // MARK: - View setup

private extension RegisterView {
    
    func setupTopLabel() {
        topLabel = UILabel()
        addSubview(topLabel)
        
        topLabel.text = "Register by your phone number"
        topLabel.font = .systemFont(ofSize: 15, weight: .bold)
        
        topLabel.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalToSuperview()
        }
    }
    
    func setupTextField() {
        textField = UITextField()
        addSubview(textField)
        
        textField.borderStyle = .roundedRect
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.keyboardType = .phonePad
        textField.returnKeyType = .done
        textField.clearButtonMode = .whileEditing
        textField.contentVerticalAlignment = .center
        textField.contentHorizontalAlignment = .leading
        textField.placeholder = "Enter your phone number"
        
        textField.snp.makeConstraints { (make) in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(topLabel)
        }
    }
    
    func setupButton() {
        button = UIButton()
        addSubview(button)
        
        button.snp.makeConstraints { (make) in
            make.top.equalTo(textField)
            make.leading.trailing.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc func buttonTapped() {
        
        viewModel.addPhoneNumber()
        
    }
    
}
