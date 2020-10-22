//
//  HomeFeedView.swift
//  InstaClone
//
//  Created by MacBook on 20/10/2020.
//  Copyright © 2020 Bartosz Raczka Development. All rights reserved.
//

import Foundation
import SnapKit

final class HomeFeedView: UIView {
    
    var viewModel: HomeFeedViewModel
    
    var topContainer: UIView!
    var bottomContainer: UIView!
    
    var photoButton: UIButton!
    var dmButton: UIButton!
    var instaCloneImage: UIImageView!
    
    var homeButton: UIButton!
    var searchButton: UIButton!
    var addButton: UIButton!
    var activityButton: UIButton!
    var profileButton: UIButton!
    
    init(with viewModel: HomeFeedViewModel){
        self.viewModel = viewModel
        super.init(frame: .zero)
        
    }
    
     required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
// MARK: -Top Container
    private func setupTopContainer() {
        topContainer = UIView()
        addSubview(topContainer)
        
        topContainer.snp.makeConstraints { (make) -> Void in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(32)
        }
    }

    private func setupPhotoButton() {
        photoButton = UIButton()
        addSubview(photoButton)
        
        photoButton.snp.makeConstraints { (make) in
            make.top.left.bottom.equalTo(topContainer)
            make.width.equalTo(32) // musimy tu zrobić kwadrat
            
        }
    }
    
    private func setupDMButton() {
        dmButton = UIButton()
        addSubview(dmButton)
        
        dmButton.snp.makeConstraints { (make) in
            make.top.right.bottom.equalTo(topContainer)
            make.width.equalTo(32)
        }
    }
    
    private func setupInstaCloneImage() {
//        TODO: Przygotować logo
    }
// MARK: -Bottom Container
    
    private func setupBottomContainer() {
        bottomContainer = UIView()
        addSubview(bottomContainer)
        
        bottomContainer.snp.makeConstraints{ (make) in
            make.bottom.left.right.equalToSuperview()
            make.height.equalTo(32)
        }
    }
    
    private func setupHomeButton() {
        homeButton = UIButton()
        addSubview(homeButton)
        
        homeButton.snp.makeConstraints{ (make) in
            make.top.bottom.left.equalTo(bottomContainer)
        }
    }
    
    private func setupSearchbutton() {
        searchButton = UIButton()
        addSubview(searchButton)
        
        searchButton.snp.makeConstraints{ (make) in
            make.top.bottom.equalTo(bottomContainer)
            make.left.equalTo(homeButton)
        }
    }
    
    private func setupAddButton() {
        addButton = UIButton()
        addSubview(addButton)
        
        addButton.snp.makeConstraints{ (make) in
            make.top.bottom.equalTo(bottomContainer)
            make.left.equalTo(searchButton)
        }
    }
    
    private func setupActivityButton() {
        activityButton = UIButton()
        addSubview(activityButton)
        
        activityButton.snp.makeConstraints{ make in
            make.top.bottom.equalTo(bottomContainer)
            make.left.equalTo(addButton)
        }
    }
    
    private func setupProfileButton() {
        profileButton = UIButton()
        addSubview(profileButton)
        
        profileButton.snp.makeConstraints{(make) in
            make.bottom.top.equalTo(bottomContainer)
            make.left.equalTo(activityButton)
            make.right.equalTo(bottomContainer)
        }
    }
// MARK: -Button Targets
    
    private func setupView() {
        photoButton.addTarget(self, action: #selector(didTapPhotoButton), for: .touchUpInside)
        dmButton.addTarget(self, action: #selector(didTapDMButton), for: .touchUpInside)
        homeButton.addTarget(self, action: #selector(didTapHomeButton), for: .touchUpInside)
        searchButton.addTarget(self, action: #selector(didTapSearchButton), for: .touchUpInside)
        addButton.addTarget(self, action: #selector(didTapAddButton), for: .touchUpInside)
        activityButton.addTarget(self, action: #selector(didTapActivityButton), for: .touchUpInside)
        profileButton.addTarget(self, action: #selector(didTapProfileButton), for: .touchUpInside)
    }
    
    
    @objc func didTapPhotoButton() {
// TODO: zrobić logikę funkcji - widok mówi do modelu a model do coordinatora
    }
    
    @objc func didTapDMButton() {
// TODO: j.w.
    }
    
    @objc func didTapHomeButton() {
    
    }
    
    @objc func didTapSearchButton() {
    
    }
    
    @objc func  didTapAddButton() {
    
    }
    
    @objc func didTapActivityButton() {
    
    }
    
    @objc func didTapProfileButton() {
    
    }
}
