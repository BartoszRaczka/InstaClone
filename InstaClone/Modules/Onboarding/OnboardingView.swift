//
//  OnboardingView.swift
//  InstaClone
//
//  Created by new on 25/11/2020.
//

import SnapKit

final class OnboardingView: UIView {
    
    private let viewModel: OnboardingViewModel
    
    private var loginStackView: UIStackView!
    private var logo: UILabel!
    private var loginTextField: TextFieldView!
    private var passwordTextField: TextFieldView!
    private var loginButtonContainer: UIView!
    private var loginButton: UIButton!
    private var registerStackView: UIStackView!
    private var noAccountQuestionLabel: UILabel!
    private var registerButton: UIButton!
    
    init(with viewModel: OnboardingViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        
        setupLoginStackView()
        setupRegisterStackView()
    }
    
    required init?(coder: NSCoder) {
        nil
    }
    
    // MARK: - Private methods
    @objc private func loginButtonTapped() {
        //TODO: call viewModel to do something with that
    }
    
    @objc private func registerButtonTapped() {
        //TODO: call viewModel to do something with that
    }
    
}

// MARK: - View setup
private extension OnboardingView {
    
    func setupLogo() {
        logo = UILabel()
        addSubview(logo)
        
        logo.text = "InstaClone"
        logo.textColor = .white
        logo.textAlignment = .center
        logo.font = UIFont(name: "SnellRoundhand-Bold", size: 44.0)
    }
    
    func setupLoginTextField() {
        var loginTextFieldViewModel = TextFieldViewModel(textFieldType: .login, placeholderText: "Phone number, username or email")
        loginTextField = TextFieldView(with: loginTextFieldViewModel)
        addSubview(loginTextField)
    }
    
    func setupPasswordTextField() {
        var passwordTextFieldViewModel = TextFieldViewModel(textFieldType: .password, placeholderText: "Password")
        passwordTextField = TextFieldView(with: passwordTextFieldViewModel)
        addSubview(passwordTextField)
    }
    
    func setupLoginButton() {
        loginButton = UIButton(type: .system)
        addSubview(loginButton)
        
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        loginButton.setTitle("Log in", for: .normal)
        loginButton.backgroundColor = .systemBlue
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.layer.cornerRadius = 5.0
        
        loginButton.snp.makeConstraints { make in
            make.top.bottom.equalTo(loginButtonContainer).inset(6.0)
            make.leading.trailing.equalTo(loginButtonContainer).inset(12.0)
        }
    }
    
    func setupLoginButtonContainer() {
        loginButtonContainer = UIView()
        addSubview(loginButtonContainer)
        
        setupLoginButton()
    }
    
    func setupLoginStackView() {
        loginStackView = UIStackView()
        addSubview(loginStackView)
        
        loginStackView.distribution = .fillEqually
        loginStackView.axis = .vertical
        
        loginStackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        setupLogo()
        setupLoginTextField()
        setupPasswordTextField()
        setupLoginButtonContainer()
        
        loginStackView.addArrangedSubview(logo)
        loginStackView.addArrangedSubview(loginTextField)
        loginStackView.addArrangedSubview(passwordTextField)
        loginStackView.addArrangedSubview(loginButtonContainer)
    }
    
    func setupNoAccountQuestionLabel() {
        noAccountQuestionLabel = UILabel()
        addSubview(noAccountQuestionLabel)
        
        noAccountQuestionLabel.text = "No account?"
        noAccountQuestionLabel.textAlignment = .right //For some reason I can't use .trailing
        noAccountQuestionLabel.textColor = .white
        noAccountQuestionLabel.font = UIFont.systemFont(ofSize: 16.0)
    }
    
    func setupRegisterButton() {
        registerButton = UIButton(type: .system)
        addSubview(registerButton)
        
        registerButton.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
        registerButton.setTitle("  Register.", for: .normal)
        registerButton.contentHorizontalAlignment = .leading
        registerButton.titleLabel?.font = UIFont.systemFont(ofSize: 16.0)
    }
    
    func setupRegisterStackView() {
        registerStackView = UIStackView()
        addSubview(registerStackView)
        
        registerStackView.distribution = .fillEqually
        registerStackView.axis = .horizontal
        
        registerStackView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
        }
        
        setupNoAccountQuestionLabel()
        setupRegisterButton()
        
        registerStackView.addArrangedSubview(noAccountQuestionLabel)
        registerStackView.addArrangedSubview(registerButton)
    }
    
}
