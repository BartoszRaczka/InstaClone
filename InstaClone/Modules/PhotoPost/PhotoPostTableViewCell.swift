//
//  PhotoPostTableViewCell.swift
//  InstaClone
//
//  Created by new on 20/10/2020.
//  Copyright © 2020 Bartosz Raczka Development. All rights reserved.
//

import SnapKit

final class PhotoPostTableViewCell: UITableViewCell {
    
    var viewModel: PhotoPostTableViewCellViewModel!
    
    var headContainer: UIView!
    var posterPhoto: UIImageView!
    var posterNameButton: UIButton!
    var moreOptionsButton: UIButton!
    var postedPhoto: UIImageView!
    var feetContainer: UIView!
    var feetIconsContainer: UIView!
    var likeIconButton: UIButton!
    var commentIconButton: UIButton!
    var dmIconButton: UIButton!
    var saveIconButton: UIButton!
    var numberOfLikesButton: UIButton!
    var postDescription: UILabel!
    var timeWhenPosted: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.viewModel = PhotoPostTableViewCellViewModel()
        
        setupHeadContainer()
        setupPosterPhoto()
        setupMoreOptionsButton()
        setupPosterName()
        setupMoreOptionsButton()
        
        setupPostedPhoto()
        
        setupFeetContainer()
        setupFeetIconsContainer()
        setupLikeIcon()
        setupCommentIcon()
        setupDMIcon()
        setupSaveIcon()
        setupNumberOfLikes()
        setupPostDescription()
        setupTimeWhenPosted()
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        nil
    }
    
//  MARK: - Objective C functions for buttons
    @objc func didTapPosterNameButton() {
        viewModel.didTapPosterNameButton()
    }
    
    @objc func didTapMoreOptionsButton() {
        viewModel.didTapMoreOptionsButton()
    }
    
    @objc func didTapLikeButton() {
        viewModel.didTapLikeButton()
    }
    
    @objc func didTapCommentButton() {
        viewModel.didTapCommentButton()
    }
    
    @objc func didTapDMButton() {
        viewModel.didTapDMButton()
    }
    
    @objc func didTapSaveButton() {
        viewModel.didTapSaveButton()
    }
    
    @objc func didTapNumberOfLikesButton() {
        viewModel.didTapNumberOfLikesButton()
    }

}

private extension PhotoPostTableViewCell {
// MARK: - View setup
    func setupHeadContainer() {
        headContainer = UIView()
        addSubview(headContainer)
        
        headContainer.snp.makeConstraints { (make) -> Void in
            make.left.top.right.equalToSuperview()
            make.height.equalTo(32.0)
        }
    }
    
    func setupPosterPhoto() {
        let image = UIImage(named: "defaultProfilePicture")
        posterPhoto = UIImageView(image: image)
        addSubview(posterPhoto)
        
        posterPhoto.snp.makeConstraints { (make) -> Void in
            make.left.top.bottom.equalTo(headContainer)
            make.width.equalTo(headContainer.snp.height)
        }
    }
        
    func setupMoreOptionsButton() {
        moreOptionsButton = UIButton()
        addSubview(moreOptionsButton)
            
        moreOptionsButton.snp.makeConstraints { (make) -> Void in
            make.top.bottom.trailing.equalTo(headContainer)
            make.width.equalTo(headContainer.snp.height)
        }
    }
        
    func setupPosterName() {
        posterNameButton = UIButton()
        addSubview(posterNameButton)
        posterNameButton.titleLabel?.text = "Poster Name"
            
        posterNameButton.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(posterPhoto.snp.right)
            make.top.bottom.equalTo(headContainer)
            make.right.equalTo(moreOptionsButton.snp.left)
        }
    }
        
// MARK: - postedPhoto
    func setupPostedPhoto() {
        let image = UIImage(named: "defaultPhoto")
        postedPhoto = UIImageView(image: image)
        addSubview(postedPhoto)
            
        postedPhoto.snp.makeConstraints { (make) -> Void in
            make.left.right.equalToSuperview()
            make.top.equalTo(headContainer.snp.bottom)
        }
    }

// MARK: - feetContainer
    func setupFeetContainer() {
        feetContainer = UIView()
        addSubview(feetContainer)
            
        feetContainer.snp.makeConstraints { (make) -> Void in
            make.left.right.equalToSuperview()
            make.top.equalTo(postedPhoto.snp.bottom)
        }
    }
        
//  MARK: feetIconsContainer
    func setupFeetIconsContainer() {
        feetIconsContainer = UIView()
        addSubview(feetIconsContainer)
        
        feetIconsContainer.snp.makeConstraints { (make) -> Void in
            make.left.top.right.equalTo(feetContainer)
            make.height.equalTo(32.0)
        }
    }
        
    func setupLikeIcon() {
        likeIconButton = UIButton()
        addSubview(likeIconButton)
        
        likeIconButton.snp.makeConstraints { (make) -> Void in
            make.left.top.bottom.equalTo(feetIconsContainer)
            make.width.equalTo(likeIconButton.snp.height)
        }
    }
        
    func setupCommentIcon() {
        commentIconButton = UIButton()
        addSubview(commentIconButton)
            
        commentIconButton.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(likeIconButton.snp.right)
            make.top.bottom.equalTo(feetIconsContainer)
            make.width.equalTo(commentIconButton.snp.height)
        }
    }
        
    func setupDMIcon() {
        dmIconButton = UIButton()
        addSubview(dmIconButton)
            
        dmIconButton.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(commentIconButton.snp.right)
            make.top.bottom.equalTo(feetIconsContainer)
            make.width.equalTo(dmIconButton.snp.height)
        }
    }
        
    func setupSaveIcon() {
        saveIconButton = UIButton()
        addSubview(saveIconButton)
        
        saveIconButton.snp.makeConstraints { (make) -> Void in
            make.top.bottom.trailing.equalTo(feetIconsContainer)
            make.width.equalTo(saveIconButton.snp.height)
        }
    }

//  MARK: rest of feetContainer stuff
    func setupNumberOfLikes() {
        numberOfLikesButton = UIButton()
        addSubview(numberOfLikesButton)
            
        numberOfLikesButton.snp.makeConstraints { (make) in
            make.left.right.equalTo(feetContainer)
            make.top.equalTo(feetIconsContainer.snp.bottom)
        }
    }
        
    func setupPostDescription() {
        postDescription = UILabel()
        addSubview(postDescription)
            
        postDescription.snp.makeConstraints { (make) -> Void in
            make.left.right.equalTo(feetContainer)
            make.top.equalTo(numberOfLikesButton.snp.bottom)
        }
    }
        
    func setupTimeWhenPosted() {
        timeWhenPosted = UILabel()
        addSubview(timeWhenPosted)
            
        timeWhenPosted.snp.makeConstraints { (make) -> Void in
            make.left.bottom.right.equalTo(feetContainer)
            make.top.equalTo(postDescription.snp.bottom)
        }
    }

// MARK: - setupView
    func setupView() {
            
    //MARK: setting images and text
        posterNameButton.setTitle("poster name", for: .normal)
        moreOptionsButton.setImage(UIImage(named: "moreOptions"), for: .normal)
        
        likeIconButton.setImage(UIImage(named: "like"), for: .normal)
        commentIconButton.setImage(UIImage(named: "comment"), for: .normal)
        dmIconButton.setImage(UIImage(named: "dm"), for: .normal)
        saveIconButton.setImage(UIImage(named: "save"), for: .normal)
            
        numberOfLikesButton.setTitle("number of likes", for: .normal)
        postDescription.text = "description"
        timeWhenPosted.text = "some time ago"
            
    //MARK: setting buttons actions
        posterNameButton.addTarget(self, action: #selector(didTapPosterNameButton), for: .touchUpInside)
        moreOptionsButton.addTarget(self, action: #selector(didTapMoreOptionsButton), for: .touchUpInside)
        likeIconButton.addTarget(self, action: #selector(didTapLikeButton), for: .touchUpInside)
        commentIconButton.addTarget(self, action: #selector(didTapCommentButton), for: .touchUpInside)
        dmIconButton.addTarget(self, action: #selector(didTapDMButton), for: .touchUpInside)
        saveIconButton.addTarget(self, action: #selector(didTapSaveButton), for: .touchUpInside)
        numberOfLikesButton.addTarget(self, action: #selector(didTapNumberOfLikesButton), for: .touchUpInside)
        
    }
}
