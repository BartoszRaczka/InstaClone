//
//  HomeFeedView.swift
//  InstaClone
//
//  Created by MacBook on 20/10/2020.
//  Copyright © 2020 Bartosz Raczka Development. All rights reserved.
//

import SnapKit

final class HomeFeedView: UIView {
    
    private let viewModel: HomeFeedViewModel
    
    private var topContainer: UIView!
    private var bottomContainer: UIView!
    
    private var photoButton: UIButton!
    private var dmButton: UIButton!
    private var logoImage: UIImageView!
    
    init(with viewModel: HomeFeedViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        
//        setupView()
    }
    
    required init?(coder: NSCoder) {
        nil
    }
  
}
    
// MARK: - View setup

private extension HomeFeedView {
    
    func setupView() {
        setupTopContainer()
        setupBottomContainer()
    }
    
    func setupTopContainer() {
        topContainer = UIView()
        addSubview(topContainer)
        
        topContainer.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(safeAreaLayoutGuide.snp.topMargin)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(32)
        }
        
        setupPhotoButton()
        setupDMButton()
        setupLogoImage()
    }

    func setupPhotoButton() {
        photoButton = UIButton()
        addSubview(photoButton)
        photoButton.setImage(UIImage(named: "defaultPhoto"), for: .normal)
        
        photoButton.snp.makeConstraints { (make) in
            make.top.leading.bottom.equalTo(topContainer)
            make.width.equalTo(32) // it must be square
        }
    }
    
    func setupDMButton() {
        dmButton = UIButton()
        addSubview(dmButton)
        dmButton.setImage(UIImage(named: "dm"), for: .normal)
        
        dmButton.snp.makeConstraints { (make) in
            make.top.trailing.bottom.equalTo(topContainer)
            make.width.equalTo(32)
        }
    }
    
    func setupLogoImage() {
        logoImage = UIImageView()
        addSubview(logoImage)
        logoImage.image = UIImage(named: "LOGO")
        
        logoImage.snp.makeConstraints { (make) in
            make.top.equalTo(topContainer.snp.top)
            make.leading.equalTo(photoButton.snp.trailing)
            make.trailing.equalTo(dmButton.snp.leading)
            make.bottom.equalTo(topContainer.snp.bottom)
        }
    }
    
    func setupBottomContainer() {
        bottomContainer = UIView()
        addSubview(bottomContainer)
        
        bottomContainer.snp.makeConstraints{ (make) in
            make.bottom.left.right.equalToSuperview()
            make.height.equalTo(32)
        }
    }
    
}
