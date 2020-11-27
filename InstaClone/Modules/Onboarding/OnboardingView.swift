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
    
    // MARK: - Private methods
    @objc private func loginButtonTapped() {
        //TODO: call viewModel to do something with that
    }
    
    @objc private func registerButtonTapped() {
        //TODO: call viewModel to do something with that
    }
    
    @objc private func loginTextFieldTextChanged() {
        //TODO: call viewModel to do something with that
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
        
        loginTextField.placeholder = "Phone number, username or email"
        loginTextField.borderStyle = .roundedRect
        loginTextField.autocorrectionType = UITextAutocorrectionType.no
        loginTextField.keyboardType = UIKeyboardType.emailAddress
        loginTextField.returnKeyType = UIReturnKeyType.done
        loginTextField.clearButtonMode = UITextField.ViewMode.whileEditing
        loginTextField.contentVerticalAlignment = .center
        loginTextField.contentHorizontalAlignment = .leading
        loginTextField.delegate = self
    }
    
    func setupPasswordTextField() {
        passwordTextField = UITextField()
        addSubview(passwordTextField)
        
        passwordTextField.text = "Password"
    }
    
    func setupLoginButton() {
        loginButton = UIButton(type: .system)
        addSubview(loginButton)
        
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
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
        
        registerButton.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
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

extension OnboardingView: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        // if implemented, called in place of textFieldDidEndEditing:
        print("TextField did end editing with reason method called")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //dodać logike która wyśle w tym momencie info do viewModelu że jest nowa wartość
        return true
    }
    //czy jeśli mamy tutaj dwa textfieldy to powinienem zrobić oddzielny plik w którym je tworze a tutaj zrobić jedynie dwie instacje? - przemyśleć i chyba tak zrobić
}
