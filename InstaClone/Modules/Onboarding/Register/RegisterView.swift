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
        
        setupTextField()
        setupTopLabel()
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
        topLabel.textColor = .white
        topLabel.textAlignment = .center
        
        topLabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(textField.snp.top)
            make.leading.trailing.equalToSuperview()
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
        textField.delegate = self
        
        textField.snp.makeConstraints { (make) in
            make.leading.trailing.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
    
    func setupButton() {
        button = UIButton()
        addSubview(button)
        button.backgroundColor = .systemBlue
        button.setTitle("Next", for: .normal)
        
        button.snp.makeConstraints { (make) in
            make.top.equalTo(textField.snp.bottom)
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
