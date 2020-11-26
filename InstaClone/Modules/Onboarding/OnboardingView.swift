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
    private var loginTextField: UITextField!
    private var passwordTextField: UITextField!
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
    
}

// MARK: - View setup
private extension OnboardingView {
    
    func setupLogo() {
        logo = UILabel()
        addSubview(logo)
        
        logo.text = "InstaClone"
        logo.textAlignment = .center
        logo.font = UIFont(name: "BrushScriptMTItalic", size: 64.0)
    }
    
    func setupLoginTextField() {
        loginTextField = UITextField()
        addSubview(loginTextField)
        
        loginTextField.text = "Phone number, username or email"
    }
    
    func setupPasswordTextField() {
        passwordTextField = UITextField()
        addSubview(passwordTextField)
        
        passwordTextField.text = "Password"
    }
    
    func setupLoginButton() {
        loginButton = UIButton(type: .system)
        addSubview(loginButton)
        
        loginButton.setTitle("Log in", for: .normal)
        loginButton.backgroundColor = .systemBlue
        loginButton.titleLabel?.textColor = .white
    }
    
    func setupLoginStackView() {
        loginStackView = UIStackView()
        addSubview(loginStackView)
        
        loginStackView.distribution = .fillEqually
        loginStackView.axis = .vertical
        
        loginStackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        setupLogo()
        setupLoginTextField()
        setupPasswordTextField()
        setupLoginButton()
        
        loginStackView.addArrangedSubview(logo)
        loginStackView.addArrangedSubview(loginTextField)
        loginStackView.addArrangedSubview(passwordTextField)
        loginStackView.addArrangedSubview(loginButton)
    }
    
    func setupNoAccountQuestionLabel() {
        noAccountQuestionLabel = UILabel()
        addSubview(noAccountQuestionLabel)
        
        noAccountQuestionLabel.text = "No account? "
        noAccountQuestionLabel.textAlignment = .right
        noAccountQuestionLabel.font = UIFont.systemFont(ofSize: 16.0)
    }
    
    func setupRegisterButton() {
        registerButton = UIButton(type: .system)
        addSubview(registerButton)
        
        registerButton.setTitle("Register.", for: .normal)
        registerButton.titleLabel?.textAlignment = .left
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
