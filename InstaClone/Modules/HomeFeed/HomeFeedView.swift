//
//  HomeFeedView.swift
//  InstaClone
//
//  Created by MacBook on 20/10/2020.
//  Copyright © 2020 Bartosz Raczka Development. All rights reserved.
//

import SnapKit

final class HomeFeedView: UIView {
    
    // MARK: - Properties
    
    private let viewModel: HomeFeedViewModel
    
    // MARK: - UI Properties
    
    private var mainView: UIStackView!
    
    // MARK: - Life Cycle
    
    init(with viewModel: HomeFeedViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        nil
    }
    
    // MARK: - Public methods
    
    func setup(with views: [UIView]) {
        views.forEach { view in
            self.mainView.addArrangedSubview(view)
        }
    }
  
}
    
// MARK: - View setup

private extension HomeFeedView {
    
    func setupView() {
        setupMainView()
    }
    
    func setupMainView() {
        mainView = UIStackView()
        mainView.axis = .vertical
        mainView.distribution = .equalSpacing
        addSubview(mainView)
        
        mainView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide)
            make.bottom.leading.trailing.equalToSuperview()
        }
    }
    
}
