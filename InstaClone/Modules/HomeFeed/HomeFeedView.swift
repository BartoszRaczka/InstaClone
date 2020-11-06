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
    private var instaCloneImage: UIImageView!
    
    init(with viewModel: HomeFeedViewModel){
        self.viewModel = viewModel
        super.init(frame: .zero)
        
        setupView()
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
            make.top.left.right.equalToSuperview()
            make.height.equalTo(32)
        }
        
        setupPhotoButton()
        setupDMButton()
        setupInstaCloneImage()
    }

    func setupPhotoButton() {
        photoButton = UIButton()
        addSubview(photoButton)
        
        photoButton.snp.makeConstraints { (make) in
            make.top.left.bottom.equalTo(topContainer)
            make.width.equalTo(32) // it must be square
        }
    }
    
    func setupDMButton() {
        dmButton = UIButton()
        addSubview(dmButton)
        
        dmButton.snp.makeConstraints { (make) in
            make.top.right.bottom.equalTo(topContainer)
            make.width.equalTo(32)
        }
    }
    
    func setupInstaCloneImage() {
        // TODO: Make a logo image
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
