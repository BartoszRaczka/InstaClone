//
//  HomeFeedViewController.swift
//  InstaClone
//
//  Created by MacBook on 23/10/2020.
//  Copyright © 2020 Bartosz Raczka Development. All rights reserved.
//

import SnapKit

final class HomeFeedViewController: UIViewController {

    // MARK: - Properties
    
    private let viewModel: HomeFeedViewModel
    
    // MARK: - Life Cycle
    
    init(with viewModel: HomeFeedViewModel, childViewControllers: [UIViewController]) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        
        setupBarButtons()
        setupAppTitle()
        
        childViewControllers.forEach {
            self.addChild($0)
        }
    }
    
    required init?(coder: NSCoder) {
        nil
    }
    
    override func loadView() {
        view = HomeFeedView(with: viewModel)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupChildViewControllers()
    }
    
    // MARK: - Private methods
    
    private func setupChildViewControllers() {
        let views = children.compactMap { $0.view }
        (self.view as? HomeFeedView)?.setup(with: views)
        
        children.forEach {
            $0.didMove(toParent: self)
        }
    }
    
}

//MARK: Setup Bar Buttons

private extension HomeFeedViewController {
    
    func setupBarButtons() {
        let dmButton = UIButton()
        dmButton.setBackgroundImage(UIImage(named: "dm"), for: .normal)
        dmButton.addTarget(self, action: #selector(didTapDMButton), for: .touchUpInside)
        dmButton.snp.makeConstraints { make in
            make.height.width.equalTo(28.0)
        }
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: dmButton)
        
        let photoButton = UIButton()
        photoButton.setBackgroundImage(UIImage(named: "defaultPhoto"), for: .normal)
        photoButton.addTarget(self, action: #selector(didTapPhotoButton), for: .touchUpInside)
        photoButton.snp.makeConstraints { make in
            make.height.width.equalTo(28.0)
        }
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: photoButton)
    }
    
    func setupAppTitle() {
        navigationItem.title = "InstaClone"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 24.0, weight: .semibold)]
    }
    
    @objc func didTapPhotoButton() {
        print("photoButton tapped")
    }
        
    @objc func didTapDMButton() {
        print("dmButton tapped")
    }
    
}
