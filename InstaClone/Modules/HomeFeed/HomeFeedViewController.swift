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
        let logOutButton = UIButton(type: .system)
        logOutButton.setBackgroundImage(UIImage(named: "logOut"), for: .normal)
        logOutButton.addTarget(self, action: #selector(didTapLogOutButton), for: .touchUpInside)
        logOutButton.snp.makeConstraints { make in
            make.height.width.equalTo(28.0)
        }
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: logOutButton)
        
        let photoButton = UIButton(type: .system)
        photoButton.setBackgroundImage(UIImage(named: "camera"), for: .normal)
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
        viewModel.didTapPhotoButton()
    }
        
    @objc func didTapLogOutButton() {
        viewModel.didTapLogOutButton()
    }
    
}
