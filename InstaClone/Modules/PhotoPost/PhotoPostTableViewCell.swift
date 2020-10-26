//
//  PhotoPostTableViewCell.swift
//  InstaClone
//
//  Created by new on 20/10/2020.
//  Copyright © 2020 Bartosz Raczka Development. All rights reserved.
//

import UIKit

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
        
        headContainer.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            headContainer.leadingAnchor.constraint(equalTo: leadingAnchor),
            headContainer.topAnchor.constraint(equalTo: topAnchor),
            headContainer.heightAnchor.constraint(equalToConstant: 32.0),
            headContainer.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    func setupPosterPhoto() {
        let image = UIImage(named: "defaultProfilePicture")
        posterPhoto = UIImageView(image: image)
        addSubview(posterPhoto)
        
        posterPhoto.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            posterPhoto.leadingAnchor.constraint(equalTo: headContainer.leadingAnchor),
            posterPhoto.topAnchor.constraint(equalTo: headContainer.topAnchor),
            posterPhoto.bottomAnchor.constraint(equalTo: headContainer.bottomAnchor),
            posterPhoto.widthAnchor.constraint(equalTo: headContainer.heightAnchor)
        ])
    }
        
    func setupMoreOptionsButton() {
        moreOptionsButton = UIButton()
        addSubview(moreOptionsButton)
            
        moreOptionsButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            moreOptionsButton.widthAnchor.constraint(equalTo: headContainer.heightAnchor),
            moreOptionsButton.topAnchor.constraint(equalTo: headContainer.topAnchor),
            moreOptionsButton.bottomAnchor.constraint(equalTo: headContainer.bottomAnchor),
            moreOptionsButton.trailingAnchor.constraint(equalTo: headContainer.trailingAnchor)
        ])
    }
        
    func setupPosterName() {
        posterNameButton = UIButton()
        addSubview(posterNameButton)
        posterNameButton.titleLabel?.text = "Poster Name"
            
        posterNameButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            posterNameButton.leadingAnchor.constraint(equalTo: posterPhoto.trailingAnchor),
            posterNameButton.topAnchor.constraint(equalTo: headContainer.topAnchor),
            posterNameButton.bottomAnchor.constraint(equalTo: headContainer.bottomAnchor),
            posterNameButton.trailingAnchor.constraint(equalTo: moreOptionsButton.leadingAnchor)
        ])
    }
        
// MARK: - postedPhoto
    func setupPostedPhoto() {
        let image = UIImage(named: "defaultPhoto")
        postedPhoto = UIImageView(image: image)
        addSubview(postedPhoto)
            
        postedPhoto.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            postedPhoto.leadingAnchor.constraint(equalTo: leadingAnchor),
            postedPhoto.topAnchor.constraint(equalTo: headContainer.bottomAnchor),
            postedPhoto.trailingAnchor.constraint(equalTo: trailingAnchor)
            // bottom zdefiniowane przez rozmiary wrzuconego zdjecia
        ])
    }

// MARK: - feetContainer
    func setupFeetContainer() {
        feetContainer = UIView()
        addSubview(feetContainer)
            
        feetContainer.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            feetContainer.leadingAnchor.constraint(equalTo: leadingAnchor),
            feetContainer.topAnchor.constraint(equalTo: postedPhoto.bottomAnchor),
            feetContainer.trailingAnchor.constraint(equalTo: trailingAnchor),
            //bottom zdefiniowane przez zawartosc containera
        ])
    }
        
//  MARK: feetIconsContainer
    func setupFeetIconsContainer() {
        feetIconsContainer = UIView()
        addSubview(feetIconsContainer)
        
        feetIconsContainer.translatesAutoresizingMaskIntoConstraints  = false
        NSLayoutConstraint.activate([
            feetIconsContainer.leadingAnchor.constraint(equalTo: feetContainer.leadingAnchor),
            feetIconsContainer.topAnchor.constraint(equalTo: feetContainer.topAnchor),
            feetIconsContainer.trailingAnchor.constraint(equalTo: feetContainer.trailingAnchor),
            feetIconsContainer.heightAnchor.constraint(equalToConstant: 32.0)
        ])
    }
        
    func setupLikeIcon() {
        likeIconButton = UIButton()
        addSubview(likeIconButton)
        
        likeIconButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            likeIconButton.leadingAnchor.constraint(equalTo: feetIconsContainer.leadingAnchor),
            likeIconButton.topAnchor.constraint(equalTo: feetIconsContainer.topAnchor),
            likeIconButton.bottomAnchor.constraint(equalTo: feetIconsContainer.bottomAnchor),
            likeIconButton.widthAnchor.constraint(equalTo: likeIconButton.heightAnchor)
        ])
    }
        
    func setupCommentIcon() {
        commentIconButton = UIButton()
        addSubview(commentIconButton)
            
        commentIconButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            commentIconButton.leadingAnchor.constraint(equalTo: likeIconButton.trailingAnchor),
            commentIconButton.topAnchor.constraint(equalTo: feetIconsContainer.topAnchor),
            commentIconButton.bottomAnchor.constraint(equalTo: feetIconsContainer.bottomAnchor),
            commentIconButton.widthAnchor.constraint(equalTo: commentIconButton.heightAnchor)
        ])
    }
        
    func setupDMIcon() {
        dmIconButton = UIButton()
        addSubview(dmIconButton)
            
        dmIconButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dmIconButton.leadingAnchor.constraint(equalTo: commentIconButton.trailingAnchor),
            dmIconButton.topAnchor.constraint(equalTo: feetIconsContainer.topAnchor),
            dmIconButton.bottomAnchor.constraint(equalTo: feetIconsContainer.bottomAnchor),
            dmIconButton.widthAnchor.constraint(equalTo: dmIconButton.heightAnchor)
        ])
    }
        
    func setupSaveIcon() {
        saveIconButton = UIButton()
        addSubview(saveIconButton)
            
        saveIconButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            saveIconButton.topAnchor.constraint(equalTo: feetIconsContainer.topAnchor),
            saveIconButton.bottomAnchor.constraint(equalTo: feetIconsContainer.bottomAnchor),
            saveIconButton.trailingAnchor.constraint(equalTo: feetIconsContainer.trailingAnchor),
            saveIconButton.widthAnchor.constraint(equalTo: saveIconButton.heightAnchor)
        ])
    }

//  MARK: rest of feetContainer stuff
    func setupNumberOfLikes() {
        numberOfLikesButton = UIButton()
        addSubview(numberOfLikesButton)
            
        numberOfLikesButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            numberOfLikesButton.leadingAnchor.constraint(equalTo: feetContainer.leadingAnchor),
            numberOfLikesButton.topAnchor.constraint(equalTo: feetIconsContainer.bottomAnchor),
            numberOfLikesButton.trailingAnchor.constraint(equalTo: feetContainer.trailingAnchor)
        ])
    }
        
    func setupPostDescription() {
        postDescription = UILabel()
        addSubview(postDescription)
            
        postDescription.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            postDescription.leadingAnchor.constraint(equalTo: feetContainer.leadingAnchor),
            postDescription.topAnchor.constraint(equalTo: numberOfLikesButton.bottomAnchor),
            postDescription.trailingAnchor.constraint(equalTo: feetContainer.trailingAnchor)
        ])
    }
        
    func setupTimeWhenPosted() {
        timeWhenPosted = UILabel()
        addSubview(timeWhenPosted)
            
        timeWhenPosted.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            timeWhenPosted.leadingAnchor.constraint(equalTo: feetContainer.leadingAnchor),
            timeWhenPosted.topAnchor.constraint(equalTo: postDescription.bottomAnchor),
            timeWhenPosted.bottomAnchor.constraint(equalTo: feetContainer.bottomAnchor),
            timeWhenPosted.trailingAnchor.constraint(equalTo: feetContainer.trailingAnchor)
        ])
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
