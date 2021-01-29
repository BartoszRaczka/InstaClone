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
    private var emailTextField: UITextField!
    private var passwordTextField: UITextField!
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
        
        setupEmailTextField()
        setupPasswordTextField()
        setupTopLabel()
        setupButton()
    }
    
}

    // MARK: - View setup

private extension RegisterView {
    
    func setupTopLabel() {
        topLabel = UILabel()
        addSubview(topLabel)
        
        topLabel.text = "Register by your E-mail"
        topLabel.font = .systemFont(ofSize: 15, weight: .bold)
        topLabel.textColor = .white
        topLabel.textAlignment = .center
        
        topLabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(emailTextField.snp.top)
            make.leading.trailing.equalToSuperview()
        }
    }
    
    func setupEmailTextField() {
        emailTextField = UITextField()
        addSubview(emailTextField)
        
        emailTextField.borderStyle = .roundedRect
        emailTextField.autocorrectionType = UITextAutocorrectionType.no
        emailTextField.keyboardType = .phonePad
        emailTextField.returnKeyType = .done
        emailTextField.clearButtonMode = .whileEditing
        emailTextField.contentVerticalAlignment = .center
        emailTextField.contentHorizontalAlignment = .leading
        emailTextField.placeholder = "Enter your E-mail"
        emailTextField.delegate = self
        
        emailTextField.snp.makeConstraints { (make) in
            make.leading.trailing.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
    
    func setupPasswordTextField() {
        passwordTextField = UITextField()
        addSubview(passwordTextField)
        
        passwordTextField.isSecureTextEntry = true
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.autocorrectionType = UITextAutocorrectionType.no
        passwordTextField.keyboardType = .phonePad
        passwordTextField.returnKeyType = .done
        passwordTextField.clearButtonMode = .whileEditing
        passwordTextField.contentVerticalAlignment = .center
        passwordTextField.contentHorizontalAlignment = .leading
        passwordTextField.placeholder = "Enter your password"
        passwordTextField.delegate = self
        
        passwordTextField.snp.makeConstraints { (make) in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(emailTextField.snp.bottom)
        }
    }
    
    func setupButton() {
        button = UIButton()
        addSubview(button)
        button.backgroundColor = .systemBlue
        button.setTitle("Next", for: .normal)
        
        button.snp.makeConstraints { (make) in
            make.top.equalTo(passwordTextField.snp.bottom)
            make.leading.trailing.equalToSuperview()
        }
        
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc func buttonTapped() {
        viewModel.buttonTapped()
    }
    
}

extension RegisterView: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let typedText = textField.text else {
            return
        }
        viewModel.textFieldDidChange(with: typedText)
    }
    
}
