//
//  PinInputView.swift
//  InstaClone
//
//  Created by new on 25/11/2020.
//

import SnapKit

final class PinInputView: UIView {
    
    // MARK: - Properties
    
    private let viewModel: PinInputViewModel
    
    private var textLabel: UILabel!
    private var textField: UITextField!
    private var button: UIButton!
    
    // MARK: - Life Cycle
    
    init(with viewModel: PinInputViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        nil
    }
    
    // MARK: - Public methods
    
    func setupView() {
        setupTextField()
        setupTextLabel()
        setupButton()
    }
    
    // MARK: - View setup
    
    private func setupTextLabel() {
        textLabel = UILabel()
        addSubview(textLabel)
        
        textLabel.text = "You will receive SMS with your pin number."
        textLabel.textColor = .white
        textLabel.textAlignment = .center
        
        textLabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(textField.snp.top)
            make.leading.trailing.equalToSuperview()
        }
    }
    
    private func setupTextField() {
        textField = UITextField()
        addSubview(textField)
        
        textField.placeholder = "Enter your pin number here"
        textField.borderStyle = .roundedRect
        textField.autocorrectionType = .no
        textField.keyboardType = .phonePad
        textField.returnKeyType = .done
        textField.clearButtonMode = .whileEditing
        textField.contentVerticalAlignment = .center
        textField.contentHorizontalAlignment = .leading
        
        textField.snp.makeConstraints { (make) in
            make.leading.trailing.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
    
    private func setupButton() {
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
