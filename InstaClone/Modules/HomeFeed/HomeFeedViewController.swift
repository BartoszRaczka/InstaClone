//
//  HomeFeedViewController.swift
//  InstaClone
//
//  Created by MacBook on 23/10/2020.
//  Copyright © 2020 Bartosz Raczka Development. All rights reserved.
//

import UIKit

final class HomeFeedViewController: UIViewController {

    //    MARK: - Properties
    
    private let viewModel: HomeFeedViewModel
    
    // MARK: - Life Cycle
    
    init(with viewModel: HomeFeedViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        
        setupBarButtons()
        setupAppTitle()
    }
    
    required init?(coder: NSCoder) {
        nil
    }
    
    override func loadView() {
        view = HomeFeedView(with: viewModel)
    }
    
}

//MARK: Setup Bar Buttons
extension HomeFeedViewController {
    
    func setupBarButtons() {
        let dmButton = UIButton()
        dmButton.setBackgroundImage(UIImage(named: "dm"), for: .normal)
        dmButton.addTarget(self, action: #selector(didTapDMButton), for: .touchUpInside)
        dmButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dmButton.heightAnchor.constraint(equalToConstant: 28.0),
            dmButton.widthAnchor.constraint(equalTo: dmButton.heightAnchor)
        ])
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: dmButton)
        
        let photoButton = UIButton()
        photoButton.setBackgroundImage(UIImage(named: "defaultPhoto"), for: .normal)
        photoButton.addTarget(self, action: #selector(didTapPhotoButton), for: .touchUpInside)
        photoButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            photoButton.heightAnchor.constraint(equalToConstant: 28.0),
            photoButton.widthAnchor.constraint(equalTo: photoButton.heightAnchor)
        ])
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
