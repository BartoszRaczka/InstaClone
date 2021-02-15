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
    private var loginTextField: TextFieldView!
    private var passwordTextField: PasswordTextFieldView!
    private var buttonContainer: UIView!
    private var button: UIButton!
    private var stackView: UIStackView!
    private var errorLabel: UILabel!
    
    // MARK: - Life Cycle
    
    init(viewModel: RegisterViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        
        bindActions()
        setupView()
    }
    
    required init?(coder: NSCoder) {
        nil
    }
    
    // MARK: - Public methods
    
    func setupView() {
        backgroundColor = .black
        setupStackView()
        setupTopLabel()
    }
    
}

    // MARK: - View setup

private extension RegisterView {
    
    func setupTopLabel() {
        topLabel = UILabel()
        addSubview(topLabel)
        
        topLabel.text = "Register by your E-mail"
        topLabel.font = UIFont(name: "SnellRoundhand-Bold", size: 30.0)
        topLabel.textColor = .white
        topLabel.textAlignment = .center
        
        topLabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(stackView.snp.top)
            make.leading.trailing.equalToSuperview()
        }
    }
    
    func setupStackView() {
        stackView = UIStackView()
        addSubview(stackView)
        
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        
        stackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        setupPasswordTextField()
        setupLoginTextField()
        setupButtonContainer()
        
        stackView.addArrangedSubview(loginTextField)
        stackView.addArrangedSubview(passwordTextField)
        stackView.addArrangedSubview(buttonContainer)
    }
    
    func setupLoginTextField() {
        viewModel.loginTextFieldViewModel = TextFieldViewModel(delegate: self.viewModel, textFieldType: .login, placeholderText: "e-mail")
        guard let loginTextFieldViewModel = viewModel.loginTextFieldViewModel else {
            return
        }
        loginTextField = TextFieldView(with: loginTextFieldViewModel)
        addSubview(loginTextField)
    }
    
    func setupPasswordTextField() {
        viewModel.passwordTextFieldViewModel = TextFieldViewModel(delegate: self.viewModel, textFieldType: .password, placeholderText: "Password")
        guard let passwordTextFieldViewModel = viewModel.passwordTextFieldViewModel else {
            return
        }
        passwordTextField = PasswordTextFieldView(with: passwordTextFieldViewModel)
        addSubview(passwordTextField)
    }
   
    func setupButtonContainer() {
        buttonContainer = UIView()
        addSubview(buttonContainer)
        
        setupButton()
    }
    
    func setupButton() {
        button = UIButton(type: .system)
        addSubview(button)
        
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.setTitle("Create account", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 5.0
        
        button.snp.makeConstraints { make in
            make.top.bottom.equalTo(buttonContainer).inset(6.0)
            make.leading.trailing.equalTo(buttonContainer).inset(12.0)
        }
        
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    func setupErrorLabel() {
        errorLabel = UILabel()
        addSubview(errorLabel)
        
        errorLabel.text = "Failed to register"
        errorLabel.textColor = .red
        errorLabel.textAlignment = .center
        errorLabel.font = UIFont.boldSystemFont(ofSize: 18)
        
        errorLabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(topLabel.snp.top)
            make.leading.trailing.equalToSuperview()
        }
    }
    
//    MARK: - Private methods
    
    @objc private func buttonTapped() {
        viewModel.buttonTapped()
    }
    
    private func bindActions() {
        viewModel.onFailedToRegisterAction = {
            self.setupErrorLabel()
        }
    }
    
}

