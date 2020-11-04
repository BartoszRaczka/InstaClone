//
//  PhotoPostTableViewCell.swift
//  InstaClone
//
//  Created by new on 20/10/2020.
//  Copyright © 2020 Bartosz Raczka Development. All rights reserved.
//

import SnapKit

final class PhotoPostCell: UITableViewCell {
    
    var viewModel: PhotoPostCellViewModel!
    
    private var headContainer: UIView!
    private var posterPhoto: UIImageView!
    private var posterNameButton: UIButton!
    private var moreOptionsButton: UIButton!
    private var postedPhoto: UIImageView!
    private var feetContainer: UIView!
    private var feetIconsContainer: UIView!
    private var likeIconButton: UIButton!
    private var commentIconButton: UIButton!
    private var dmIconButton: UIButton!
    private var saveIconButton: UIButton!
    private var numberOfLikesButton: UIButton!
    private var postDescription: UILabel!
    private var timeWhenPosted: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.viewModel = PhotoPostCellViewModel()
        
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
//MARK: - View setup
private extension PhotoPostCell {

    func setupHeadContainer() {
        headContainer = UIView()
        addSubview(headContainer)
        
        headContainer.snp.makeConstraints { make in
            make.leading.top.trailing.equalToSuperview()
            make.height.equalTo(32.0)
        }
    }
    
    func setupPosterPhoto() {
        let image = UIImage(named: "defaultProfilePicture")
        posterPhoto = UIImageView(image: image)
        addSubview(posterPhoto)
        
        posterPhoto.snp.makeConstraints { make in
            make.leading.top.bottom.equalTo(headContainer)
            make.width.equalTo(headContainer.snp.height)
        }
    }
        
    func setupMoreOptionsButton() {
        moreOptionsButton = UIButton()
        addSubview(moreOptionsButton)
        moreOptionsButton.setImage(UIImage(named: "moreOptions"), for: .normal)
        moreOptionsButton.addTarget(self, action: #selector(didTapMoreOptionsButton), for: .touchUpInside)
            
        moreOptionsButton.snp.makeConstraints { make in
            make.top.bottom.trailing.equalTo(headContainer)
            make.width.equalTo(headContainer.snp.height)
        }
    }
        
    func setupPosterName() {
        posterNameButton = UIButton()
        addSubview(posterNameButton)
        posterNameButton.setTitle("poster name", for: .normal)
        posterNameButton.addTarget(self, action: #selector(didTapPosterNameButton), for: .touchUpInside)
            
        posterNameButton.snp.makeConstraints { make in
            make.leading.equalTo(posterPhoto.snp.trailing)
            make.top.bottom.equalTo(headContainer)
            make.trailing.equalTo(moreOptionsButton.snp.leading)
        }
    }
        
    //MARK: - postedPhoto
    func setupPostedPhoto() {
        let image = UIImage(named: "defaultPhoto")
        postedPhoto = UIImageView(image: image)
        addSubview(postedPhoto)
            
        postedPhoto.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(headContainer.snp.bottom)
        }
    }

    //MARK: - feetContainer
    func setupFeetContainer() {
        feetContainer = UIView()
        addSubview(feetContainer)
            
        feetContainer.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(postedPhoto.snp.bottom)
        }
    }
        
    //MARK: feetIconsContainer
    func setupFeetIconsContainer() {
        feetIconsContainer = UIView()
        addSubview(feetIconsContainer)
        
        feetIconsContainer.snp.makeConstraints { make in
            make.leading.top.trailing.equalTo(feetContainer)
            make.height.equalTo(32.0)
        }
    }
        
    func setupLikeIcon() {
        likeIconButton = UIButton()
        addSubview(likeIconButton)
        likeIconButton.setImage(UIImage(named: "like"), for: .normal)
        likeIconButton.addTarget(self, action: #selector(didTapLikeButton), for: .touchUpInside)
        
        likeIconButton.snp.makeConstraints { make in
            make.leading.top.bottom.equalTo(feetIconsContainer)
            make.width.equalTo(likeIconButton.snp.height)
        }
    }
        
    func setupCommentIcon() {
        commentIconButton = UIButton()
        addSubview(commentIconButton)
        commentIconButton.setImage(UIImage(named: "comment"), for: .normal)
        commentIconButton.addTarget(self, action: #selector(didTapCommentButton), for: .touchUpInside)
            
        commentIconButton.snp.makeConstraints { make in
            make.leading.equalTo(likeIconButton.snp.trailing)
            make.top.bottom.equalTo(feetIconsContainer)
            make.width.equalTo(commentIconButton.snp.height)
        }
    }
        
    func setupDMIcon() {
        dmIconButton = UIButton()
        addSubview(dmIconButton)
        dmIconButton.setImage(UIImage(named: "dm"), for: .normal)
        dmIconButton.addTarget(self, action: #selector(didTapDMButton), for: .touchUpInside)
            
        dmIconButton.snp.makeConstraints { make in
            make.leading.equalTo(commentIconButton.snp.trailing)
            make.top.bottom.equalTo(feetIconsContainer)
            make.width.equalTo(dmIconButton.snp.height)
        }
    }
        
    func setupSaveIcon() {
        saveIconButton = UIButton()
        addSubview(saveIconButton)
        saveIconButton.setImage(UIImage(named: "save"), for: .normal)
        saveIconButton.addTarget(self, action: #selector(didTapSaveButton), for: .touchUpInside)
        
        saveIconButton.snp.makeConstraints { make in
            make.top.bottom.trailing.equalTo(feetIconsContainer)
            make.width.equalTo(saveIconButton.snp.height)
        }
    }

    //MARK: rest of feetContainer stuff
    func setupNumberOfLikes() {
        numberOfLikesButton = UIButton()
        addSubview(numberOfLikesButton)
        numberOfLikesButton.setTitle("number of likes", for: .normal)
        numberOfLikesButton.addTarget(self, action: #selector(didTapNumberOfLikesButton), for: .touchUpInside)
            
        numberOfLikesButton.snp.makeConstraints { make in
            make.leading.trailing.equalTo(feetContainer)
            make.top.equalTo(feetIconsContainer.snp.bottom)
        }
    }
        
    func setupPostDescription() {
        postDescription = UILabel()
        addSubview(postDescription)
        postDescription.text = "description"
            
        postDescription.snp.makeConstraints { make in
            make.leading.trailing.equalTo(feetContainer)
            make.top.equalTo(numberOfLikesButton.snp.bottom)
        }
    }
        
    func setupTimeWhenPosted() {
        timeWhenPosted = UILabel()
        addSubview(timeWhenPosted)
        timeWhenPosted.text = "some time ago"
            
        timeWhenPosted.snp.makeConstraints { make in
            make.leading.bottom.trailing.equalTo(feetContainer)
            make.top.equalTo(postDescription.snp.bottom)
        }
    }
}
