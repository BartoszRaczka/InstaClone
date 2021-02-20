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
    private var feetContainer: UIStackView!
    private var feetIconsContainer: UIView!
    private var iconsStackView: UIStackView!
    private var likeIconButton: UIButton!
    private var commentIconButton: UIButton!
    private var dmIconButton: UIButton!
    private var saveIconButton: UIButton!
    private var numberOfLikesButton: UIButton!
    private var postDescription: UILabel!
    private var timeWhenPosted: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupHeadContainer()
        setupPostedPhoto()
        setupFeetContainer()
    }
    
    required init?(coder: NSCoder) {
        nil
    }
    
    //MARK: - Public Methods
    
    func update(with viewModel: PhotoPostCellViewModel) {
        self.viewModel = viewModel
        posterNameButton.setTitle(viewModel.posterName, for: .normal)
        numberOfLikesButton.setTitle(viewModel.numberOfLikes, for: .normal)
        postDescription.text = viewModel.description
        timeWhenPosted.text = viewModel.timeOfPosting
    }
    
    // MARK: - Objective C functions for buttons
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
// MARK: - View setup
private extension PhotoPostCell {

    func setupHeadContainer() {
        headContainer = UIView()
        contentView.addSubview(headContainer)
        
        headContainer.snp.makeConstraints { make in
            make.leading.top.trailing.equalToSuperview().inset(8.0)
            make.height.equalTo(42.0)
        }
        
        setupPosterPhoto()
        setupMoreOptionsButton()
        setupPosterName()
    }
    
    func setupPosterPhoto() {
        let image = UIImage(named: "defaultProfilePicture")
        posterPhoto = UIImageView(image: image)
        contentView.addSubview(posterPhoto)
        
        posterPhoto.snp.makeConstraints { make in
            make.leading.top.bottom.equalTo(headContainer)
            make.width.equalTo(headContainer.snp.height)
        }
    }
        
    func setupMoreOptionsButton() {
        moreOptionsButton = UIButton(type: .system)
        contentView.addSubview(moreOptionsButton)
        moreOptionsButton.setImage(UIImage(named: "moreOptions"), for: .normal)
        moreOptionsButton.addTarget(self, action: #selector(didTapMoreOptionsButton), for: .touchUpInside)
            
        moreOptionsButton.snp.makeConstraints { make in
            make.top.bottom.trailing.equalTo(headContainer)
            make.width.equalTo(headContainer.snp.height)
        }
    }
        
    func setupPosterName() {
        posterNameButton = UIButton(type: .system)
        contentView.addSubview(posterNameButton)
        posterNameButton.setTitle("Poster name", for: .normal)
        posterNameButton.contentHorizontalAlignment = .leading
        posterNameButton.addTarget(self, action: #selector(didTapPosterNameButton), for: .touchUpInside)
            
        posterNameButton.snp.makeConstraints { make in
            make.leading.equalTo(posterPhoto.snp.trailing)
            make.top.bottom.equalTo(headContainer)
            make.trailing.equalTo(moreOptionsButton.snp.leading)
        }
    }
        
    // MARK: - postedPhoto
    func setupPostedPhoto() {
        let image = UIImage(named: "defaultPhoto")
        postedPhoto = UIImageView(image: image)
        contentView.addSubview(postedPhoto)
            
        postedPhoto.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(headContainer.snp.bottom)
        }
    }

    // MARK: - feetContainer
    func setupFeetContainer() {
        feetContainer = UIStackView()
        contentView.addSubview(feetContainer)
        feetContainer.axis = .vertical
            
        feetContainer.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview().inset(8.0)
            make.top.equalTo(postedPhoto.snp.bottom)
        }
        
        setupFeetIconsContainer()
        setupNumberOfLikes()
        setupPostDescription()
        setupTimeWhenPosted()
        
        feetContainer.addArrangedSubview(feetIconsContainer)
        feetContainer.addArrangedSubview(numberOfLikesButton)
        feetContainer.addArrangedSubview(postDescription)
        feetContainer.addArrangedSubview(timeWhenPosted)
    }
        
    // MARK: feetIconsContainer
    func setupFeetIconsContainer() {
        feetIconsContainer = UIView()
        contentView.addSubview(feetIconsContainer)
        
        feetIconsContainer.snp.makeConstraints { make in
            make.height.equalTo(32.0)
        }
        
        setupIconsStackView()
        setupSaveIcon()
    }
    
    func setupIconsStackView() {
        iconsStackView = UIStackView()
        contentView.addSubview(iconsStackView)
        
        iconsStackView.snp.makeConstraints { make in
            make.leading.top.bottom.equalTo(feetIconsContainer)
        }
        
        setupLikeIcon()
        setupCommentIcon()
        setupDMIcon()
        
        iconsStackView.addArrangedSubview(likeIconButton)
        iconsStackView.addArrangedSubview(commentIconButton)
        iconsStackView.addArrangedSubview(dmIconButton)
    }
    
        
    func setupLikeIcon() {
        likeIconButton = UIButton(type: .system)
        contentView.addSubview(likeIconButton)
        likeIconButton.setImage(UIImage(named: "like"), for: .normal)
        likeIconButton.addTarget(self, action: #selector(didTapLikeButton), for: .touchUpInside)

        likeIconButton.snp.makeConstraints { make in
            make.width.equalTo(likeIconButton.snp.height)
        }
    }
        
    func setupCommentIcon() {
        commentIconButton = UIButton(type: .system)
        contentView.addSubview(commentIconButton)
        commentIconButton.setImage(UIImage(named: "comment"), for: .normal)
        commentIconButton.addTarget(self, action: #selector(didTapCommentButton), for: .touchUpInside)

        commentIconButton.snp.makeConstraints { make in
            make.width.equalTo(commentIconButton.snp.height)
        }
    }
        
    func setupDMIcon() {
        dmIconButton = UIButton(type: .system)
        contentView.addSubview(dmIconButton)
        dmIconButton.setImage(UIImage(named: "dm"), for: .normal)
        dmIconButton.addTarget(self, action: #selector(didTapDMButton), for: .touchUpInside)

        dmIconButton.snp.makeConstraints { make in
            make.width.equalTo(dmIconButton.snp.height)
        }
    }
        
    func setupSaveIcon() {
        saveIconButton = UIButton(type: .system)
        contentView.addSubview(saveIconButton)
        saveIconButton.setImage(UIImage(named: "save"), for: .normal)
        saveIconButton.addTarget(self, action: #selector(didTapSaveButton), for: .touchUpInside)
        
        saveIconButton.snp.makeConstraints { make in
            make.top.bottom.trailing.equalTo(feetIconsContainer)
            make.width.equalTo(saveIconButton.snp.height)
        }
    }

    // MARK: rest of feetContainer stuff
    func setupNumberOfLikes() {
        numberOfLikesButton = UIButton(type: .system)
        contentView.addSubview(numberOfLikesButton)
        numberOfLikesButton.setTitle("number of likes", for: .normal)
        numberOfLikesButton.contentHorizontalAlignment = .leading
        numberOfLikesButton.addTarget(self, action: #selector(didTapNumberOfLikesButton), for: .touchUpInside)
    }
        
    func setupPostDescription() {
        postDescription = UILabel()
        contentView.addSubview(postDescription)
        postDescription.text = "description"
    }
        
    func setupTimeWhenPosted() {
        timeWhenPosted = UILabel()
        contentView.addSubview(timeWhenPosted)
        timeWhenPosted.text = "some time ago"
    }
}
